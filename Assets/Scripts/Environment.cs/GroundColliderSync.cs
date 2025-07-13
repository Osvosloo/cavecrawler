using UnityEngine;

[RequireComponent(typeof(LineRenderer))]
[RequireComponent(typeof(EdgeCollider2D))]
public class GroundColliderSync : MonoBehaviour
{
    private LineRenderer lineRenderer;
    private EdgeCollider2D edgeCollider;

    void Start()
    {
        lineRenderer = GetComponent<LineRenderer>();
        edgeCollider = GetComponent<EdgeCollider2D>();

        UpdateCollider();
    }

    void UpdateCollider()
    {
        int pointCount = lineRenderer.positionCount;
        Vector2[] colliderPoints = new Vector2[pointCount];
        for (int i = 0; i < pointCount; i++)
        {
            Vector3 pos = lineRenderer.GetPosition(i);
            colliderPoints[i] = new Vector2(pos.x, pos.y);
        }
        edgeCollider.points = colliderPoints;
    }
}
