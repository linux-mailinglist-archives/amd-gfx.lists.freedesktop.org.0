Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D75E84B2EE1
	for <lists+amd-gfx@lfdr.de>; Fri, 11 Feb 2022 21:53:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6A5110E263;
	Fri, 11 Feb 2022 20:53:31 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2085.outbound.protection.outlook.com [40.107.236.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE36B10E235
 for <amd-gfx@lists.freedesktop.org>; Fri, 11 Feb 2022 20:53:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RdC2CVYZmWBIGqw11JtIwpBtFq+2u/JMxPAP94X0GfFEiuHVjHLlfBbzGrR8+JlUm7RnP73hSk4diap+SIjim7/wrg88gedaoDmtTIwE32OuhFefpFJ/LGuU7uO7KSS4eX4quV8fkf2CEZfPOMRRZALE/Bur9xslAEIS4pJMesG0ZbHXVoorpxSLgYtOrTyVygwPz6RYi83CVZW0n2OEbh7wDDa7y2SJBrbhUjx9J0923SsE/J+n0KDm1idWuCQGzWb1aShufFUFuTxna9GYXHfC3yI88foBgiIKcdgKd0IcuwGyUOM6PHXmje2jrnT8n2YQcZ/nX/DReB7HiL6l5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UZaUyB5CqAgNq4K7y9BiRLQoor5VvIeTb32anDRp0Sw=;
 b=LGSl6k3wxuFT8F750Dj6mMxGFoztNojKCA57Wp5AvRNqfXmyIUvcCUlEB9WZIVQo1gtdMev00KPEvdiiCahF8vXfaghga5NPFsbNbrAdpI9DRunWUSWsIoxZikZM4WW8O+hvfTTYWsKoViqKnFRLqEbZ0aBcuaPJET46Yc+jL1xOzwpD8U3b7M5T0GmLOraXUQqtu0MHbx6S3KTqg1Wu+UaitvAOwRQRihW8KIxD563m1TRkFShWWdIIn7yrr6svkJaKqvKKWBhygRhVOdNJNWoql6TIMm/Ci6QhLd9+00YWm2LDi9sP63QxKj+QAeJMckkRLALLHeuXV/UpG0ltRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UZaUyB5CqAgNq4K7y9BiRLQoor5VvIeTb32anDRp0Sw=;
 b=kivg4q8X5WDtSjozZd1CnWJzmOxcL3myFbdineeXaZtTo0LZ5zx9KeQuE7tRW2Wmd8i0gHQIDpdU36eqbS9KHu0X2BC14fitCO4T91tBiKNXE5pYMIo9s4Jm7w2JjDzvnXxrwgjifXDVUBTt1CW25gg2ovzvBOAy7MSqxYyWgqU=
Received: from BN9PR03CA0967.namprd03.prod.outlook.com (2603:10b6:408:109::12)
 by MN0PR12MB5763.namprd12.prod.outlook.com (2603:10b6:208:376::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.11; Fri, 11 Feb
 2022 20:53:27 +0000
Received: from BN8NAM11FT051.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:109:cafe::e4) by BN9PR03CA0967.outlook.office365.com
 (2603:10b6:408:109::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.12 via Frontend
 Transport; Fri, 11 Feb 2022 20:53:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT051.mail.protection.outlook.com (10.13.177.66) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4975.11 via Frontend Transport; Fri, 11 Feb 2022 20:53:27 +0000
Received: from localhost.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Fri, 11 Feb
 2022 14:53:26 -0600
From: Luben Tuikov <luben.tuikov@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v2 1/1] drm/amdgpu: Show IP discovery in sysfs
Date: Fri, 11 Feb 2022 15:53:12 -0500
Message-ID: <20220211205312.6410-2-luben.tuikov@amd.com>
X-Mailer: git-send-email 2.35.0.3.gb23dac905b
In-Reply-To: <20220211205312.6410-1-luben.tuikov@amd.com>
References: <20220211205312.6410-1-luben.tuikov@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 87849c3e-cefc-4475-491c-08d9eda08d71
X-MS-TrafficTypeDiagnostic: MN0PR12MB5763:EE_
X-Microsoft-Antispam-PRVS: <MN0PR12MB57633960F57BDD9A6504DBF599309@MN0PR12MB5763.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:339;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QvSL0bGBukl5Be3Hr6XQijVCvdfCrJWbT5NVWV3owxKpD+TIpj41OhxROyt6nTu4eTptWd/jwj/b6kjvDez27Sk2Pc3qcC3W9NF+EXAtZeh+r34lwtBMhO8sx8yhyeH0r7fsYuoz3bgtWU72ZyXSi5O60bO4sFW5vi5uo98Yd99mTdSmqmKNesv99KzsTqyn+aIhA5chrsSdkOifbXVlU8wNdvf4H72linh4X2b85uz/BzuD1JrkZQmbw3kWz7Xpd0K7ru974+WyDvijMK+cgkBtWYWqtqd+GllBK3tYnln2pCmcd39E6O1C1QXyikvBFvdcz8a+iAJMJiycjS04eTp6BBsNShyMbveKp2vnfaDoj7cBKZph98cIbxoYvTk05UsNBb4OT79xZT10F2V42y6up02N//og4Pzmf2hk9ThS60+VKX1EGLuf2oFMs8eZ/VPxq5lGdgE2jEYLnG+uPhrDyqhB+JxpJzu4pXUm0bDnkBVh4LGOcn15d6klosoefBgRL9E9v1Obk1sRfDcaC/iKFQAfQW9LioNs1CxRD4Tgx8euliRudA2Eq3SFITgxf2doIXZjodycyE2fiMYRvaY/qcgi+2AdK+sE9zy263SRVzV8tzlzn5Q17FL9BFqCBkARu7SCxcWcMukn8g7qblsKwS7XnlOs4PRpiVDtXLG8Rpb2JxcIyDhn8rWhM1F4oGP6yRljX3oA6bWku78+Xg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(36840700001)(46966006)(40470700004)(30864003)(36860700001)(2906002)(7696005)(36756003)(81166007)(44832011)(47076005)(5660300002)(6666004)(356005)(40460700003)(508600001)(26005)(8936002)(70586007)(83380400001)(70206006)(6916009)(2616005)(1076003)(336012)(186003)(426003)(82310400004)(8676002)(4326008)(316002)(54906003)(16526019)(86362001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2022 20:53:27.2416 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 87849c3e-cefc-4475-491c-08d9eda08d71
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT051.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5763
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
Cc: Alex Deucher <Alexander.Deucher@amd.com>, Tom StDenis <tom.stdenis@amd.com>,
 Luben Tuikov <luben.tuikov@amd.com>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Add IP discovery data in sysfs. The format is:
/sys/class/drm/cardX/device/ip_discovery/die/D/B/I/<attrs>
where,
X is the card ID, an integer,
D is the die ID, an integer,
B is the IP HW ID, an integer, aka block type,
I is the IP HW ID instance, an integer.
<attrs> are the attributes of the block instance. At the moment these
include HW ID, instance number, major, minor, revision, number of base
addresses, and the base addresses themselves.

A symbolic link of the acronym HW ID is also created, under D/, if you
prefer to browse by something humanly accessible.

Cc: Alex Deucher <Alexander.Deucher@amd.com>
Cc: Tom StDenis <tom.stdenis@amd.com>
Signed-off-by: Luben Tuikov <luben.tuikov@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu.h           |   4 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c | 493 ++++++++++++++++++
 2 files changed, 497 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
index e4eb812ade2fa4..3a126dce8a2fe9 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
@@ -772,6 +772,8 @@ struct amd_powerplay {
 	const struct amd_pm_funcs *pp_funcs;
 };
 
+struct ip_discovery_top;
+
 /* polaris10 kickers */
 #define ASICID_IS_P20(did, rid)		(((did == 0x67DF) && \
 					 ((rid == 0xE3) || \
@@ -1097,6 +1099,8 @@ struct amdgpu_device {
 	bool				ram_is_direct_mapped;
 
 	struct list_head                ras_list;
+
+	struct ip_discovery_top         *ip_top;
 };
 
 static inline struct amdgpu_device *drm_to_adev(struct drm_device *ddev)
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c
index 6a08bece24d736..c8dbdb78988ce0 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c
@@ -360,8 +360,11 @@ static int amdgpu_discovery_init(struct amdgpu_device *adev)
 	return r;
 }
 
+static void amdgpu_discovery_sysfs_fini(struct amdgpu_device *adev);
+
 void amdgpu_discovery_fini(struct amdgpu_device *adev)
 {
+	amdgpu_discovery_sysfs_fini(adev);
 	kfree(adev->mman.discovery_bin);
 	adev->mman.discovery_bin = NULL;
 }
@@ -382,6 +385,494 @@ static int amdgpu_discovery_validate_ip(const struct ip *ip)
 	return 0;
 }
 
+/* ================================================== */
+
+struct ip_hw_instance {
+	struct kobject kobj; /* ip_discovery/die/#die/#hw_id/#instance/<attrs...> */
+
+	int hw_id;
+	u8  num_instance;
+	u8  major, minor, revision;
+
+	int num_base_addresses;
+	u32 base_addr[];
+};
+
+struct ip_hw_id {
+	struct kset hw_id_kset;  /* ip_discovery/die/#die/#hw_id/, contains ip_hw_instance */
+	int hw_id;
+};
+
+struct ip_die_entry {
+	struct kset ip_kset;     /* ip_discovery/die/#die/, contains ip_hw_id  */
+	u16 num_ips;
+};
+
+/* -------------------------------------------------- */
+
+struct ip_hw_instance_attr {
+	struct attribute attr;
+	ssize_t (*show)(struct ip_hw_instance *ip_hw_instance, char *buf);
+};
+
+static ssize_t hw_id_show(struct ip_hw_instance *ip_hw_instance, char *buf)
+{
+	return sysfs_emit(buf, "%d\n", ip_hw_instance->hw_id);
+}
+
+static ssize_t num_instance_show(struct ip_hw_instance *ip_hw_instance, char *buf)
+{
+	return sysfs_emit(buf, "%d\n", ip_hw_instance->num_instance);
+}
+
+static ssize_t major_show(struct ip_hw_instance *ip_hw_instance, char *buf)
+{
+	return sysfs_emit(buf, "%d\n", ip_hw_instance->major);
+}
+
+static ssize_t minor_show(struct ip_hw_instance *ip_hw_instance, char *buf)
+{
+	return sysfs_emit(buf, "%d\n", ip_hw_instance->minor);
+}
+
+static ssize_t revision_show(struct ip_hw_instance *ip_hw_instance, char *buf)
+{
+	return sysfs_emit(buf, "%d\n", ip_hw_instance->revision);
+}
+
+static ssize_t num_base_addresses_show(struct ip_hw_instance *ip_hw_instance, char *buf)
+{
+	return sysfs_emit(buf, "%d\n", ip_hw_instance->num_base_addresses);
+}
+
+static ssize_t base_addr_show(struct ip_hw_instance *ip_hw_instance, char *buf)
+{
+	ssize_t res, at;
+	int ii;
+
+	for (res = at = ii = 0; ii < ip_hw_instance->num_base_addresses; ii++) {
+		/* Here we satisfy the condition that, at + size <= PAGE_SIZE.
+		 */
+		if (at + 12 > PAGE_SIZE)
+			break;
+		res = sysfs_emit_at(buf, at, "0x%08X\n",
+				    ip_hw_instance->base_addr[ii]);
+		if (res <= 0)
+			break;
+		at += res;
+	}
+
+	return res < 0 ? res : at;
+}
+
+static struct ip_hw_instance_attr ip_hw_attr[] = {
+	__ATTR_RO(hw_id),
+	__ATTR_RO(num_instance),
+	__ATTR_RO(major),
+	__ATTR_RO(minor),
+	__ATTR_RO(revision),
+	__ATTR_RO(num_base_addresses),
+	__ATTR_RO(base_addr),
+};
+
+static struct attribute *ip_hw_instance_attrs[] = {
+	&ip_hw_attr[0].attr,
+	&ip_hw_attr[1].attr,
+	&ip_hw_attr[2].attr,
+	&ip_hw_attr[3].attr,
+	&ip_hw_attr[4].attr,
+	&ip_hw_attr[5].attr,
+	&ip_hw_attr[6].attr,
+	NULL,
+};
+ATTRIBUTE_GROUPS(ip_hw_instance);
+
+#define to_ip_hw_instance(x) container_of(x, struct ip_hw_instance, kobj)
+#define to_ip_hw_instance_attr(x) container_of(x, struct ip_hw_instance_attr, attr)
+
+static ssize_t ip_hw_instance_attr_show(struct kobject *kobj,
+					struct attribute *attr,
+					char *buf)
+{
+	struct ip_hw_instance *ip_hw_instance = to_ip_hw_instance(kobj);
+	struct ip_hw_instance_attr *ip_hw_attr = to_ip_hw_instance_attr(attr);
+
+	if (!ip_hw_attr->show)
+		return -EIO;
+
+	return ip_hw_attr->show(ip_hw_instance, buf);
+}
+
+static const struct sysfs_ops ip_hw_instance_sysfs_ops = {
+	.show = ip_hw_instance_attr_show,
+};
+
+static void ip_hw_instance_release(struct kobject *kobj)
+{
+	struct ip_hw_instance *ip_hw_instance = to_ip_hw_instance(kobj);
+
+	kfree(ip_hw_instance);
+}
+
+static struct kobj_type ip_hw_instance_ktype = {
+	.release = ip_hw_instance_release,
+	.sysfs_ops = &ip_hw_instance_sysfs_ops,
+	.default_groups = ip_hw_instance_groups,
+};
+
+/* -------------------------------------------------- */
+
+#define to_ip_hw_id(x)  container_of(to_kset(x), struct ip_hw_id, hw_id_kset)
+
+static void ip_hw_id_release(struct kobject *kobj)
+{
+	struct ip_hw_id *ip_hw_id = to_ip_hw_id(kobj);
+
+	if (!list_empty(&ip_hw_id->hw_id_kset.list))
+		DRM_ERROR("ip_hw_id->hw_id_kset is not empty");
+	kfree(ip_hw_id);
+}
+
+static struct kobj_type ip_hw_id_ktype = {
+	.release = ip_hw_id_release,
+	.sysfs_ops = &kobj_sysfs_ops,
+};
+
+/* -------------------------------------------------- */
+
+static void die_kobj_release(struct kobject *kobj);
+static void ip_disc_release(struct kobject *kobj);
+
+struct ip_die_entry_attribute {
+	struct attribute attr;
+	ssize_t (*show)(struct ip_die_entry *ip_die_entry, char *buf);
+};
+
+#define to_ip_die_entry_attr(x)  container_of(x, struct ip_die_entry_attribute, attr)
+
+static ssize_t num_ips_show(struct ip_die_entry *ip_die_entry, char *buf)
+{
+	return sysfs_emit(buf, "%d\n", ip_die_entry->num_ips);
+}
+
+/* If there are more ip_die_entry attrs, other than the number of IPs,
+ * we can make this intro an array of attrs, and then initialize
+ * ip_die_entry_attrs in a loop.
+ */
+static struct ip_die_entry_attribute num_ips_attr =
+	__ATTR_RO(num_ips);
+
+static struct attribute *ip_die_entry_attrs[] = {
+	&num_ips_attr.attr,
+	NULL,
+};
+ATTRIBUTE_GROUPS(ip_die_entry); /* ip_die_entry_groups */
+
+#define to_ip_die_entry(x) container_of(to_kset(x), struct ip_die_entry, ip_kset)
+
+static ssize_t ip_die_entry_attr_show(struct kobject *kobj,
+				      struct attribute *attr,
+				      char *buf)
+{
+	struct ip_die_entry_attribute *ip_die_entry_attr = to_ip_die_entry_attr(attr);
+	struct ip_die_entry *ip_die_entry = to_ip_die_entry(kobj);
+
+	if (!ip_die_entry_attr->show)
+		return -EIO;
+
+	return ip_die_entry_attr->show(ip_die_entry, buf);
+}
+
+static void ip_die_entry_release(struct kobject *kobj)
+{
+	struct ip_die_entry *ip_die_entry = to_ip_die_entry(kobj);
+
+	if (!list_empty(&ip_die_entry->ip_kset.list))
+		DRM_ERROR("ip_die_entry->ip_kset is not empty");
+	kfree(ip_die_entry);
+}
+
+static const struct sysfs_ops ip_die_entry_sysfs_ops = {
+	.show = ip_die_entry_attr_show,
+};
+
+static struct kobj_type ip_die_entry_ktype = {
+	.release = ip_die_entry_release,
+	.sysfs_ops = &ip_die_entry_sysfs_ops,
+	.default_groups = ip_die_entry_groups,
+};
+
+static struct kobj_type die_kobj_ktype = {
+	.release = die_kobj_release,
+	.sysfs_ops = &kobj_sysfs_ops,
+};
+
+static struct kobj_type ip_discovery_ktype = {
+	.release = ip_disc_release,
+	.sysfs_ops = &kobj_sysfs_ops,
+};
+
+struct ip_discovery_top {
+	struct kobject kobj;    /* ip_discovery/ */
+	struct kset die_kset;   /* ip_discovery/die/, contains ip_die_entry */
+	struct amdgpu_device *adev;
+};
+
+static void die_kobj_release(struct kobject *kobj)
+{
+	struct ip_discovery_top *ip_top = container_of(to_kset(kobj),
+						       struct ip_discovery_top,
+						       die_kset);
+	if (!list_empty(&ip_top->die_kset.list))
+		DRM_ERROR("ip_top->die_kset is not empty");
+}
+
+static void ip_disc_release(struct kobject *kobj)
+{
+	struct ip_discovery_top *ip_top = container_of(kobj, struct ip_discovery_top,
+						       kobj);
+	struct amdgpu_device *adev = ip_top->adev;
+
+	adev->ip_top = NULL;
+	kfree(ip_top);
+}
+
+static int amdgpu_discovery_sysfs_ips(struct amdgpu_device *adev,
+				      struct ip_die_entry *ip_die_entry,
+				      const size_t _ip_offset, const int num_ips)
+{
+	int ii, jj, kk, res;
+
+	DRM_DEBUG("num_ips:%d", num_ips);
+
+	/* Find all IPs of a given HW ID, and add their instance to
+	 * #die/#hw_id/#instance/<attributes>
+	 */
+	for (ii = 0; ii < HW_ID_MAX; ii++) {
+		struct ip_hw_id *ip_hw_id = NULL;
+		size_t ip_offset = _ip_offset;
+
+		for (jj = 0; jj < num_ips; jj++) {
+			struct ip *ip;
+			struct ip_hw_instance *ip_hw_instance;
+
+			ip = (struct ip *)(adev->mman.discovery_bin + ip_offset);
+			if (amdgpu_discovery_validate_ip(ip) ||
+			    le16_to_cpu(ip->hw_id) != ii)
+				goto next_ip;
+
+			DRM_DEBUG("match:%d @ ip_offset:%ld", ii, ip_offset);
+
+			/* We have a hw_id match; register the hw
+			 * block if not yet registered.
+			 */
+			if (!ip_hw_id) {
+				ip_hw_id = kzalloc(sizeof(*ip_hw_id), GFP_KERNEL);
+				if (!ip_hw_id)
+					return -ENOMEM;
+				ip_hw_id->hw_id = ii;
+
+				kobject_set_name(&ip_hw_id->hw_id_kset.kobj, "%d", ii);
+				ip_hw_id->hw_id_kset.kobj.kset = &ip_die_entry->ip_kset;
+				ip_hw_id->hw_id_kset.kobj.ktype = &ip_hw_id_ktype;
+				res = kset_register(&ip_hw_id->hw_id_kset);
+				if (res) {
+					DRM_ERROR("Couldn't register ip_hw_id kset");
+					kfree(ip_hw_id);
+					return res;
+				}
+				if (hw_id_names[ii]) {
+					res = sysfs_create_link(&ip_die_entry->ip_kset.kobj,
+								&ip_hw_id->hw_id_kset.kobj,
+								hw_id_names[ii]);
+					if (res) {
+						DRM_ERROR("Couldn't create IP link %s in IP Die:%s\n",
+							  hw_id_names[ii],
+							  kobject_name(&ip_die_entry->ip_kset.kobj));
+					}
+				}
+			}
+
+			/* Now register its instance.
+			 */
+			ip_hw_instance = kzalloc(struct_size(ip_hw_instance,
+							     base_addr,
+							     ip->num_base_address),
+						 GFP_KERNEL);
+			if (!ip_hw_instance) {
+				DRM_ERROR("no memory for ip_hw_instance");
+				return -ENOMEM;
+			}
+			ip_hw_instance->hw_id = le16_to_cpu(ip->hw_id); /* == ii */
+			ip_hw_instance->num_instance = ip->number_instance;
+			ip_hw_instance->major = ip->major;
+			ip_hw_instance->minor = ip->minor;
+			ip_hw_instance->revision = ip->revision;
+			ip_hw_instance->num_base_addresses = ip->num_base_address;
+
+			for (kk = 0; kk < ip_hw_instance->num_base_addresses; kk++)
+				ip_hw_instance->base_addr[kk] = ip->base_address[kk];
+
+			kobject_init(&ip_hw_instance->kobj, &ip_hw_instance_ktype);
+			ip_hw_instance->kobj.kset = &ip_hw_id->hw_id_kset;
+			res = kobject_add(&ip_hw_instance->kobj, NULL,
+					  "%d", ip_hw_instance->num_instance);
+next_ip:
+			ip_offset += sizeof(*ip) + 4 * (ip->num_base_address - 1);
+		}
+	}
+
+	return 0;
+}
+
+static int amdgpu_discovery_sysfs_recurse(struct amdgpu_device *adev)
+{
+	struct binary_header *bhdr;
+	struct ip_discovery_header *ihdr;
+	struct die_header *dhdr;
+	struct kset *die_kset = &adev->ip_top->die_kset;
+	u16 num_dies, die_offset, num_ips;
+	size_t ip_offset;
+	int ii, res;
+
+	bhdr = (struct binary_header *)adev->mman.discovery_bin;
+	ihdr = (struct ip_discovery_header *)(adev->mman.discovery_bin +
+					      le16_to_cpu(bhdr->table_list[IP_DISCOVERY].offset));
+	num_dies = le16_to_cpu(ihdr->num_dies);
+
+	DRM_DEBUG("number of dies: %d\n", num_dies);
+
+	for (ii = 0; ii < num_dies; ii++) {
+		struct ip_die_entry *ip_die_entry;
+
+		die_offset = le16_to_cpu(ihdr->die_info[ii].die_offset);
+		dhdr = (struct die_header *)(adev->mman.discovery_bin + die_offset);
+		num_ips = le16_to_cpu(dhdr->num_ips);
+		ip_offset = die_offset + sizeof(*dhdr);
+
+		/* Add the die to the kset.
+		 *
+		 * dhdr->die_id == ii, which was checked in
+		 * amdgpu_discovery_reg_base_init().
+		 */
+
+		ip_die_entry = kzalloc(sizeof(*ip_die_entry), GFP_KERNEL);
+		if (!ip_die_entry)
+			return -ENOMEM;
+
+		ip_die_entry->num_ips = num_ips;
+
+		kobject_set_name(&ip_die_entry->ip_kset.kobj, "%d", le16_to_cpu(dhdr->die_id));
+		ip_die_entry->ip_kset.kobj.kset = die_kset;
+		ip_die_entry->ip_kset.kobj.ktype = &ip_die_entry_ktype;
+		res = kset_register(&ip_die_entry->ip_kset);
+		if (res) {
+			DRM_ERROR("Couldn't register ip_die_entry kset");
+			kfree(ip_die_entry);
+			return res;
+		}
+
+		amdgpu_discovery_sysfs_ips(adev, ip_die_entry, ip_offset, num_ips);
+	}
+
+	return 0;
+}
+
+static int amdgpu_discovery_sysfs_init(struct amdgpu_device *adev)
+{
+	struct kset *die_kset;
+	int res;
+
+	adev->ip_top = kzalloc(sizeof(*adev->ip_top), GFP_KERNEL);
+	if (!adev->ip_top)
+		return -ENOMEM;
+
+	adev->ip_top->adev = adev;
+
+	res = kobject_init_and_add(&adev->ip_top->kobj, &ip_discovery_ktype,
+				   &adev->dev->kobj, "ip_discovery");
+	if (res) {
+		DRM_ERROR("Couldn't init and add ip_discovery/");
+		goto Err;
+	}
+
+	die_kset = &adev->ip_top->die_kset;
+	kobject_set_name(&die_kset->kobj, "%s", "die");
+	die_kset->kobj.parent = &adev->ip_top->kobj;
+	die_kset->kobj.ktype = &die_kobj_ktype;
+	res = kset_register(&adev->ip_top->die_kset);
+	if (res) {
+		DRM_ERROR("Couldn't register die_kset");
+		goto Err;
+	}
+
+	res = amdgpu_discovery_sysfs_recurse(adev);
+
+	return res;
+Err:
+	kobject_put(&adev->ip_top->kobj);
+	return res;
+}
+
+/* -------------------------------------------------- */
+
+#define list_to_kobj(el) container_of(el, struct kobject, entry)
+
+static void amdgpu_discovery_sysfs_ip_hw_free(struct ip_hw_id *ip_hw_id)
+{
+	struct list_head *el, *tmp;
+	struct kset *hw_id_kset;
+
+	hw_id_kset = &ip_hw_id->hw_id_kset;
+	spin_lock(&hw_id_kset->list_lock);
+	list_for_each_prev_safe(el, tmp, &hw_id_kset->list) {
+		list_del_init(el);
+		spin_unlock(&hw_id_kset->list_lock);
+		/* kobject is embedded in ip_hw_instance */
+		kobject_put(list_to_kobj(el));
+		spin_lock(&hw_id_kset->list_lock);
+	}
+	spin_unlock(&hw_id_kset->list_lock);
+	kobject_put(&ip_hw_id->hw_id_kset.kobj);
+}
+
+static void amdgpu_discovery_sysfs_die_free(struct ip_die_entry *ip_die_entry)
+{
+	struct list_head *el, *tmp;
+	struct kset *ip_kset;
+
+	ip_kset = &ip_die_entry->ip_kset;
+	spin_lock(&ip_kset->list_lock);
+	list_for_each_prev_safe(el, tmp, &ip_kset->list) {
+		list_del_init(el);
+		spin_unlock(&ip_kset->list_lock);
+		amdgpu_discovery_sysfs_ip_hw_free(to_ip_hw_id(list_to_kobj(el)));
+		spin_lock(&ip_kset->list_lock);
+	}
+	spin_unlock(&ip_kset->list_lock);
+	kobject_put(&ip_die_entry->ip_kset.kobj);
+}
+
+static void amdgpu_discovery_sysfs_fini(struct amdgpu_device *adev)
+{
+	struct list_head *el, *tmp;
+	struct kset *die_kset;
+
+	die_kset = &adev->ip_top->die_kset;
+	spin_lock(&die_kset->list_lock);
+	list_for_each_prev_safe(el, tmp, &die_kset->list) {
+		list_del_init(el);
+		spin_unlock(&die_kset->list_lock);
+		amdgpu_discovery_sysfs_die_free(to_ip_die_entry(list_to_kobj(el)));
+		spin_lock(&die_kset->list_lock);
+	}
+	spin_unlock(&die_kset->list_lock);
+	kobject_put(&adev->ip_top->die_kset.kobj);
+	kobject_put(&adev->ip_top->kobj);
+}
+
+/* ================================================== */
+
 int amdgpu_discovery_reg_base_init(struct amdgpu_device *adev)
 {
 	struct binary_header *bhdr;
@@ -492,6 +983,8 @@ int amdgpu_discovery_reg_base_init(struct amdgpu_device *adev)
 		}
 	}
 
+	amdgpu_discovery_sysfs_init(adev);
+
 	return 0;
 }
 
-- 
2.35.0.3.gb23dac905b

