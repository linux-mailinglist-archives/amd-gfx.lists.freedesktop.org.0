Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8DLrACyqhGlL4QMAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Thu, 05 Feb 2026 15:33:16 +0100
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 006B8F40CF
	for <lists+amd-gfx@lfdr.de>; Thu, 05 Feb 2026 15:33:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E230F10E8E9;
	Thu,  5 Feb 2026 14:33:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="15h+hNXs";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11010056.outbound.protection.outlook.com
 [40.93.198.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84C0710E8E9
 for <amd-gfx@lists.freedesktop.org>; Thu,  5 Feb 2026 14:33:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=amKf7XZZ2estHoDHD267WLxgqxW68MedfcoiJbCZ+MxiDSH5GhVZdku1AvpiaSVuKfmTUgxRDU0Bv6JOqw+LuWWOSTywea/Ev4I9JC29n6EO/S64CKYFQsygsbJ1XbGCeLRIPKoDh8soaztMESAIIAwkGXahFJWplby8RF+krO5lLRnKSRsDQihlya2IHGKr5PkHs8ulAtj9reGFUdqp4JOO2MAv7E200VGGBikaQ1K71xtm78TNRSqIwVXV8+yLjA1Dx6tv/v7n5b/dSbG8yMFMmumtMKv2GOwYB2BK1OE3LhMmAAD2AyH1oDjgcq5i56lyA+UQFPSFAD79UuDT7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nk+YV3XrOda3crRmv8k+rZS9SqKlew8vq1B/VjXFFkk=;
 b=TGhCWjUyClWeF0B4Rp0hzS6rgvcl7FdS/Rm+g7bSnLBc2+E9Zk2eszrlzKKJzacAbj3ShttHASd42dqU9wD7J4SoMqj0Dk3QhvrOKm6kLM44Dr0d1RZXQZsHkkJgDp4ZRs5VOk+ydgsayoGAkxqeuzIw3tPQVISuIxb6+jJum+UuznBxo6bQj94ETiYAfToZnJOgxULRx7pVLXbKZJG7QcDEPp8dAC+lQHwLj3lsPV5FHpht3SrmV8P46xvB7qpOZj1ay2NZkWP3S4i/5N9NPI3ykVoenpkQl5nzRCqSleGNhS3MrLxNnbISxF07R4JhfpQTj3FR9crqermAInmAPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nk+YV3XrOda3crRmv8k+rZS9SqKlew8vq1B/VjXFFkk=;
 b=15h+hNXsze67KBK4dIgriFuGR9EpBjySM+2FNLOw8+iaENDH2fz51wGsokkGZoqAGWwIi7KaQdQbc/932fqCA6ZzoyYwxCXgQJinTTHjjWM3ld8GzXUIXidAhxmOoMRdK950dCxrd9M4IXlwTMBA5eqvtBEH4u8onMlWpaWZ1KA=
Received: from BLAPR03CA0089.namprd03.prod.outlook.com (2603:10b6:208:329::34)
 by DS0PR12MB9039.namprd12.prod.outlook.com (2603:10b6:8:de::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.13; Thu, 5 Feb
 2026 14:32:59 +0000
Received: from BN3PEPF0000B36F.namprd21.prod.outlook.com
 (2603:10b6:208:329:cafe::ba) by BLAPR03CA0089.outlook.office365.com
 (2603:10b6:208:329::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.14 via Frontend Transport; Thu,
 5 Feb 2026 14:32:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN3PEPF0000B36F.mail.protection.outlook.com (10.167.243.166) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.0 via Frontend Transport; Thu, 5 Feb 2026 14:32:59 +0000
Received: from srishanm-Cloudripper.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 5 Feb 2026 08:32:51 -0600
From: Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>
To: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, "Alex
 Deucher" <alexander.deucher@amd.com>
CC: <amd-gfx@lists.freedesktop.org>, Srinivasan Shanmugam
 <srinivasan.shanmugam@amd.com>, Tvrtko Ursulin <tursulin@ursulin.net>
Subject: [PATCH v4] drm/gem: Make drm_gem_objects_lookup() self-cleaning on
 failure v4
Date: Thu, 5 Feb 2026 20:02:38 +0530
Message-ID: <20260205143238.288961-1-srinivasan.shanmugam@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B36F:EE_|DS0PR12MB9039:EE_
X-MS-Office365-Filtering-Correlation-Id: 4acb85d9-9b15-4b76-215c-08de64c375e2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|36860700013|82310400026; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZDk2N1dVdXZubmg2UjVJcEt0aWhJUzlqZ1RuWTByb3BiYzJCRXNpOSs4VU1O?=
 =?utf-8?B?RUV1OGdYS3AvMk9PQmRkWGJ6RmV2dXlmZVRDaUFwN3pET2JuazV5bTk2ZE1u?=
 =?utf-8?B?T01uZGVPc29rMXhzNS9BRFJRTWpJWmpTRmlBbTRxczFkOGJxNTZ5ZjZqRTJC?=
 =?utf-8?B?NmxoY3dtNnpOZCtoWDQ5WmY1SnhTMUVSL0JvOFh5Wi9CL21HSm5UdkprUkpn?=
 =?utf-8?B?c011OVR4dTRZcVp2MUl6cnhTZCtSdmV4clJZSG5NM0U0K1M0S3NaN2ZvRXN3?=
 =?utf-8?B?cVIrWG1zcHh0ODZVNm11QmVYVDFKWTRMUUtORHZKeXFvU1RrQ1NvblpRUDFa?=
 =?utf-8?B?aW5JUE05MTAydVljWDcvMVQ4elNsemVTTlRQb0RmVnZsa3pCamZoZU80QWZU?=
 =?utf-8?B?UWpLZGwrelVMdmlEckVwWXVaS2x5VzNRdW9MbFd2N0JrNjF2RVQ0amp6NWZm?=
 =?utf-8?B?VDRCZUJoL1F2OHdGSHdTMDNYaEM0RXM2TnlMbE0rRy93Tm41cG1NMitqRXl6?=
 =?utf-8?B?NG9zNC90aHBKbXl3UndXKzM4RFZMV0F2UndkZmdUZG1QWUVzM2VTNWFJbUto?=
 =?utf-8?B?NnlMT2Qzdk55cXpLeUQ0WHJ3dGxQU1kyckJZZGdyNVczd3lmaXNIZFdsUjJn?=
 =?utf-8?B?dXduZlJjTkJDOHVKaFFBQTdOR1ZGK3NGelRnUUE2ME5JSzN5LzBHZDBpTEVY?=
 =?utf-8?B?VXVEbDBvTWxWSkRtWitoZG9pZ3BFRGZ2NTNFQ0pDTnVqNlJ6UWxPdkdSV1Bq?=
 =?utf-8?B?bEVzK0F0VWx1Q0FpNlhaYys0b0xkcjc3NmNnQ0I4Rzdsak5qUjhhKytQV0xN?=
 =?utf-8?B?Nm9NY3JSTytEYklmMjZBbmlkUkFEM0kyUTVmMkx5Z1p4QlowRGc0NkZHOXFL?=
 =?utf-8?B?aUVsVHo5bjdrMlJiYjlVU3RqbmwrbTZyNTd6RHZMLzlwdFFUdE5pOGNZdFF2?=
 =?utf-8?B?MlNyVFU2Yjl2MHZuRlNoYXRtTHJXSUt1LzlPaXhCVnNFVEZLWEtkRnNqRXBt?=
 =?utf-8?B?U1RmWVZjQmNBT0F4bnhPbXVBaVpDKzY1WkF2N3J0RW44OHF5dE1xZFBaYWRP?=
 =?utf-8?B?bkFFMU9GamgwSU1hZXBJeFR0SXVvL2ROWHJTbXZDbWZ1R2hRNGVPbW9ZOElT?=
 =?utf-8?B?ZTZwNlhxcVF3VWZyM0l2ejdNU0FCdnlxTTZIY1FOQ3dQQ1QzUUFMSmtmc21Q?=
 =?utf-8?B?MzNOeVRnQ0s2MDFGY1RvK0x1Nk1ncEdRMStwRU9veVFCMWZrRzlGRCsxZFE1?=
 =?utf-8?B?UzJwa2Vaenhxc0hrVlhQRVQwOWhwSTk2MDVuSkY5STgwU3hBeC9vemQzRnVv?=
 =?utf-8?B?UWFMaXZDTXF6N3BZYmlDYmlXakxJem1aRnRSYTdvS3VMRkhhQnV5ZmpnaVdv?=
 =?utf-8?B?SGNBSWhHcXJBbVlkWHN4czI1MEVhZDI2L0JHUkxZa3l2WkhSMHJvVGZYd1lM?=
 =?utf-8?B?SDJQU2pJT1dLT3lqaFNuR1c3VUUvVUdKSy9SZlNxOVR1THlhT3hJWmRER1Mz?=
 =?utf-8?B?eDNnQVJTRldUWVQ4S1VTS1FWZlJHeGRMcHdudlZPTWNNWnIxNk1SQzJWakc2?=
 =?utf-8?B?akdYbDZFYVRvQ3VYc2FVVFRaRlZFMGJqRno4NUwrK0RURHpTckFQSVJkTXBE?=
 =?utf-8?B?bTJXNVg4MUlKbjMzUXVuMWRrOStjQ3FBd1VpWDkvcmV3WkdJY0RPWkxMMlNL?=
 =?utf-8?B?ZVRiZ3B0aUV2eUo3OGQxd1FnYWFYZHdHa2ZJUGJWaGhraUFDZjRiQUdLcEh0?=
 =?utf-8?B?RkFldnREVDJFSlR0QysxalA0MlE1QzhvU0EzMlYrQ1pqYlE3ZG1zN1d3bks4?=
 =?utf-8?B?QllUQXVUeDlRR0FpMUFVS3BTQXJwNzlNRmNXMVo2bFFyZ2ZtN1k2cFpvVnZW?=
 =?utf-8?B?OXd3andHTXdnZHRTbHU4NHFLU3BNOHozak16Q05ML21oOUNoRGpoSDdFbWdH?=
 =?utf-8?B?MVRvSkJVdGNYMHRjakVYaVo2eG9kd0lBNVhtZTBObm85TUZjM2dVK3FPdXA3?=
 =?utf-8?B?NFl2WUg3N1JEd05MTHpvcm5YL2tIQUsxSUVqeG02WG9IV05HWWd5TkkvYXJP?=
 =?utf-8?B?d0JWdStIOERIV211QkVjWlVLZEV4Mko3YUNHbUl3ODJnWFUzaHU3UlU1OUt0?=
 =?utf-8?B?YW9KUmlub01PZCtvOGJpZ1ptOEg5aFEzVGJBaWRCQ0xIM2lkdW1uN0Y1Umtw?=
 =?utf-8?Q?LyIgGW1R71ix1nx0Dn9gDqE=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: tRLNicMJajgOEX5VvBQTSn1D7zt0oIynHSz1Otl4bXYaFAFXdnn1OMbDceQewYoPjTI0dqJmGoBAsBJLJU3CVyBV4q9H/rF72+YubIgjHnB+UA16La9WK23G4oiOLOtQxPwYk/WGJxK9aYr5WU6U0pZepIdGQam5QTu8cFzUgTpBXva27NBJIBFUxTaIBoIWRoURNacfFoewa+TY34DHleg1FkRLNcnka9ga/0RoJJXltlr8tmLpNU9/cbAinlTOHKL0hbZYApdePvaVOk8jR7Npz8WyJ4eUCwmvxRyHN0m5IyNSCNNOoyXTMCry3czH+Zh7VupJPvcdDLzuJqb1Y+ZECWO8QdwQs+l4x29ZRyExdVb1qPnS0t33h/Jt2dd4j2+S5jlmvbiVSHMufu7/ooYWxkHr2qGR+2cLUgqHC5r66V6nLuB0hsk/E4gm6G4P
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2026 14:32:59.1915 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4acb85d9-9b15-4b76-215c-08de64c375e2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN3PEPF0000B36F.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB9039
X-BeenThere: amd-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion list for AMD gfx <amd-gfx.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/amd-gfx>
List-Post: <mailto:amd-gfx@lists.freedesktop.org>
List-Help: <mailto:amd-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=subscribe>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER(0.00)[srinivasan.shanmugam@amd.com,amd-gfx-bounces@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:christian.koenig@amd.com,m:alexander.deucher@amd.com,m:srinivasan.shanmugam@amd.com,m:tursulin@ursulin.net,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[amd-gfx@lists.freedesktop.org];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[srinivasan.shanmugam@amd.com,amd-gfx-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[amd.com:+];
	HAS_XOIP(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[amd-gfx];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,amd.com:email,amd.com:dkim,amd.com:mid]
X-Rspamd-Queue-Id: 006B8F40CF
X-Rspamd-Action: no action

drm_gem_objects_lookup() can allocate the output array and take
references on GEM objects before it fails.

If an error happens part-way through, callers previously had to clean up
partially created results themselves. This relied on subtle and
undocumented behavior and was easy to get wrong.

Make drm_gem_objects_lookup() clean up on failure. The function now
drops any references it already took, frees the array, and sets
*objs_out to NULL before returning an error.

On success, behavior is unchanged. Existing callers remain correct and
their error cleanup paths simply do nothing when *objs_out is NULL.

v3: Move partial-lookup cleanup into objects_lookup(), perform reference
dropping outside the lock, and remove reliance on __GFP_ZERO or implicit
NULL handling. (Christian)

v4: Use goto-style error handling in objects_lookup(), drop partial
references outside the lock, and simplify drm_gem_objects_lookup()
cleanup by routing failures through err_free_handles as suggested.
(Christian)

Cc: Alex Deucher <alexander.deucher@amd.com>
Suggested-by: Christian König <christian.koenig@amd.com>
Suggested-by: Tvrtko Ursulin <tursulin@ursulin.net>
Signed-off-by: Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>
---
 drivers/gpu/drm/drm_gem.c | 48 ++++++++++++++++++++++++++-------------
 1 file changed, 32 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
index a1a9c828938b..e1218728352d 100644
--- a/drivers/gpu/drm/drm_gem.c
+++ b/drivers/gpu/drm/drm_gem.c
@@ -750,14 +750,22 @@ static int objects_lookup(struct drm_file *filp, u32 *handle, int count,
 	for (i = 0; i < count; i++) {
 		/* Check if we currently have a reference on the object */
 		obj = idr_find(&filp->object_idr, handle[i]);
-		if (!obj) {
-			ret = -ENOENT;
-			break;
-		}
+		if (!obj)
+			goto err;
+
 		drm_gem_object_get(obj);
 		objs[i] = obj;
 	}
+
 	spin_unlock(&filp->table_lock);
+	return 0;
+
+err:
+	ret = -ENOENT;
+	spin_unlock(&filp->table_lock);
+
+	while (i--)
+		drm_gem_object_put(objs[i]);
 
 	return ret;
 }
@@ -775,9 +783,11 @@ static int objects_lookup(struct drm_file *filp, u32 *handle, int count,
  * For a single handle lookup, use drm_gem_object_lookup().
  *
  * Returns:
- * @objs filled in with GEM object pointers. Returned GEM objects need to be
- * released with drm_gem_object_put(). -ENOENT is returned on a lookup
- * failure. 0 is returned on success.
+ * On success, *@objs_out is set to an allocated array of @count pointers
+ * containing GEM objects. The caller must drop the references with
+ * drm_gem_object_put() and free the array with kvfree().
+ *
+ * On failure, *@objs_out is set to NULL and no further action is required.
  *
  */
 int drm_gem_objects_lookup(struct drm_file *filp, void __user *bo_handles,
@@ -785,36 +795,42 @@ int drm_gem_objects_lookup(struct drm_file *filp, void __user *bo_handles,
 {
 	struct drm_device *dev = filp->minor->dev;
 	struct drm_gem_object **objs;
-	u32 *handles;
+	u32 *handles = NULL;
 	int ret;
 
+	*objs_out = NULL;
 	if (!count)
 		return 0;
 
-	objs = kvmalloc_array(count, sizeof(struct drm_gem_object *),
-			     GFP_KERNEL | __GFP_ZERO);
+	objs = kvmalloc_array(count, sizeof(*objs), GFP_KERNEL);
 	if (!objs)
 		return -ENOMEM;
 
-	*objs_out = objs;
-
 	handles = kvmalloc_array(count, sizeof(u32), GFP_KERNEL);
 	if (!handles) {
 		ret = -ENOMEM;
-		goto out;
+		goto err_free_objs;
 	}
 
 	if (copy_from_user(handles, bo_handles, count * sizeof(u32))) {
 		ret = -EFAULT;
 		drm_dbg_core(dev, "Failed to copy in GEM handles\n");
-		goto out;
+		goto err_free_handles;
 	}
 
 	ret = objects_lookup(filp, handles, count, objs);
-out:
+	if (ret)
+		goto err_free_handles;
+
 	kvfree(handles);
-	return ret;
+	*objs_out = objs;
+	return 0;
 
+err_free_handles:
+	kvfree(handles);
+err_free_objs:
+	kvfree(objs);
+	return ret;
 }
 EXPORT_SYMBOL(drm_gem_objects_lookup);
 
-- 
2.34.1

