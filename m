Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A72CDD48A6
	for <lists+amd-gfx@lfdr.de>; Fri, 11 Oct 2019 21:53:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 917D86EC8D;
	Fri, 11 Oct 2019 19:53:47 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750052.outbound.protection.outlook.com [40.107.75.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7A836EC8C
 for <amd-gfx@lists.freedesktop.org>; Fri, 11 Oct 2019 19:53:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Geo6e2S6TgNpkGEl5JmD+BHzZwgitVGGg0MWDvi2XiXHlO7hDXwh1teFOCsl0yVJ0esfpTqi0V28iM8hJ+XPr/Rberd7ddfz+1Ed2FbCOh0IUaDxj/mbJ18Oy+rXK/KktGR6icqzAUzRIHLn1KxWY3wAWki8FyFWy1CC+q5JR5ur5BiJuB5vIIpV6+Syy9XvMRtmWSCo0Niyn9BMp0Y73lGCv3VpEzZRtW27kOqWk4BV53n0+X2jTBW5HYGgK0ezBZWMRrIO0buifjenIQpR7Xr6Gi2re/a5rhYMdcUBVOtcXmnwU8MN1fFA0MQ+VP3eB23qn2jUTjXBlWKn29mr6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F/LnkbHLOhgaE8EfpX39Pn1tXDjNXEys1KlrLWk63kg=;
 b=D5ytJYytH8f8xxb4gmAXzxflSwM2+WnPjofxOZWLyjDI2rbiHvryQrqCBFu1u5joJMzMNKekZvkqlUDwR4RvEillHQxbqOt7bpui9PF7/oVJtF6kGAZXWerXWwlTmV7hz25UyILu3zCox8L7aZlpIkh7dFL++hkjarPCxDHqmfWzjAeiwDKDMf5/KkoqV7iXpRUIcke+zSEvpNldVewnxCRkvDXvHJfFVEybScQWY+scFq/v8NoJWa/nUihS1M+Ynb4YSJRengdWkugBHXbJEIwlF7E0j9IT7QAlyJmxULVcUB9hD24obf0cp3icMmHVN4yGvHrPA5xh/aH6g0UunQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from DM6PR12CA0020.namprd12.prod.outlook.com (2603:10b6:5:1c0::33)
 by DM5PR12MB2358.namprd12.prod.outlook.com (2603:10b6:4:b3::34) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.16; Fri, 11 Oct
 2019 19:53:44 +0000
Received: from BY2NAM03FT051.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::206) by DM6PR12CA0020.outlook.office365.com
 (2603:10b6:5:1c0::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.16 via Frontend
 Transport; Fri, 11 Oct 2019 19:53:44 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 BY2NAM03FT051.mail.protection.outlook.com (10.152.85.169) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2347.21 via Frontend Transport; Fri, 11 Oct 2019 19:53:44 +0000
Received: from blakha.amd.com (10.180.168.240) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Fri, 11 Oct 2019
 14:53:42 -0500
From: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 03/29] drm/amd/display: disable ext aux support for vega
Date: Fri, 11 Oct 2019 15:52:58 -0400
Message-ID: <20191011195324.16268-4-Bhawanpreet.Lakha@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191011195324.16268-1-Bhawanpreet.Lakha@amd.com>
References: <20191011195324.16268-1-Bhawanpreet.Lakha@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(136003)(376002)(346002)(396003)(428003)(199004)(189003)(356004)(53416004)(2351001)(7696005)(6666004)(4326008)(1076003)(51416003)(6916009)(76176011)(47776003)(305945005)(316002)(5660300002)(16586007)(2906002)(478600001)(70586007)(14444005)(26005)(36756003)(426003)(81156014)(86362001)(8676002)(81166006)(126002)(8936002)(48376002)(50466002)(486006)(50226002)(476003)(336012)(446003)(186003)(70206006)(11346002)(2616005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB2358; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1aebc76b-37a7-4106-88cc-08d74e84b8f9
X-MS-TrafficTypeDiagnostic: DM5PR12MB2358:
X-Microsoft-Antispam-PRVS: <DM5PR12MB235870DC3FCE2A37C6D30E77F9970@DM5PR12MB2358.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2657;
X-Forefront-PRVS: 0187F3EA14
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Wt9290KVhw9sUwMLViSxS9zJ8KnnrOZVXY3fF1lQHphigKFE8Yv02i9e83NdZ4Nz4jpxZC2iWAvcy/XhSYtopqsWAW6roQ3pVxxg1hJb1iAO2D6tEFn3IyZQ3ByJO7m+LZuLOftn10M2/vsw5ZJTlt5zMnYdnU/3Pu6mz+y3naRAsBCVoQQxanDgLeYAyoO7Y1HqXWcIh48mW+AnO1drBleftW8KE84OFTG8UCbnQHglV0QJrB4xAy5jTVW1KGI8c51DtcZzhJfG/JKs/XbpNUtSOwHm+oCdqiTLK6dl1a9B1Yhlmt/Swrj9+5NLbcjusjNzRytB5jYrWye7Kk8O9twbro0u+VHrTK97cOGmX8Nvsj/BKkRHtyX2G5eOyXPDuU+Yh9a50osTr3CLeaCl9hyeKjjRhKmzDAxWCfRsIqQ=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2019 19:53:44.0684 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1aebc76b-37a7-4106-88cc-08d74e84b8f9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB2358
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F/LnkbHLOhgaE8EfpX39Pn1tXDjNXEys1KlrLWk63kg=;
 b=o3ga4IPhnZJ0+JrWokjaB/F/H3mHutuaA5pk+IyBB6sFTPtvnTtHW9Dgo9ncyq83bOdaTyGQs0G5Zv06+96e2a/BpCPdgXNxgxYn5AO7T3bGzwGdbN6G3i8mybjySo8Ik7Kp+dezs/hXaxpzTbV3iKb0+H4BP+Toxo2GHawcBkc=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is
 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=permerror action=none
 header.from=amd.com;
X-BeenThere: amd-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Discussion list for AMD gfx <amd-gfx.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/amd-gfx>
List-Post: <mailto:amd-gfx@lists.freedesktop.org>
List-Help: <mailto:amd-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=subscribe>
Cc: Roman Li <Roman.Li@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogUm9tYW4gTGkgPFJvbWFuLkxpQGFtZC5jb20+CgpbV2h5XQpFYXJsaWVyIGNoYW5nZXMg
dG8gc3VwcG9ydCBjb25maWd1cmFibGUgYXV4IHRpbWVvdXQKY2F1c2VkIGRjIGluaXQgZmFpbHVy
ZSBvbiB2ZWdhIGR1ZSB0byBtaXNzaW5nIHJlZyBkZWZzLgpOZWVkcyB0byBiZSBkaXNhYmxlZCB1
bnRpbCBpbXBsZW1lbnRlZCBmb3IgdmVnYS4KCltIb3ddClNldCBleHRlbmRlZCBhdXggdGltZW91
dCBjYXAgZm9yIHZlZ2EgdG8gZmFsc2UuCgpmaXhlczogZHJtL2FtZC9kaXNwbGF5OiBjb25maWd1
cmFibGUgYXV4IHRpbWVvdXQgc3VwcG9ydAoKU2lnbmVkLW9mZi1ieTogUm9tYW4gTGkgPFJvbWFu
LkxpQGFtZC5jb20+ClJldmlld2VkLUJ5OiBhYmRvdWxheWUgYmVydGhlIDxhYmRvdWxheWUuYmVy
dGhlQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjZTEyMC9k
Y2UxMjBfcmVzb3VyY2UuYyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwg
MSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9k
Yy9kY2UxMjAvZGNlMTIwX3Jlc291cmNlLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkv
ZGMvZGNlMTIwL2RjZTEyMF9yZXNvdXJjZS5jCmluZGV4IDc1ZGQ5NDU3Y2MyZC4uYzMwZmFhMDVm
ZDI3IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNlMTIwL2Rj
ZTEyMF9yZXNvdXJjZS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY2Ux
MjAvZGNlMTIwX3Jlc291cmNlLmMKQEAgLTEwMTcsNyArMTAxNyw3IEBAIHN0YXRpYyBib29sIGNv
bnN0cnVjdCgKIAlkYy0+Y2Fwcy5tYXhfY3Vyc29yX3NpemUgPSAxMjg7CiAJZGMtPmNhcHMuZHVh
bF9saW5rX2R2aSA9IHRydWU7CiAJZGMtPmNhcHMucHNwX3NldHVwX3BhbmVsX21vZGUgPSB0cnVl
OwotCWRjLT5jYXBzLmV4dGVuZGVkX2F1eF90aW1lb3V0X3N1cHBvcnQgPSB0cnVlOworCWRjLT5j
YXBzLmV4dGVuZGVkX2F1eF90aW1lb3V0X3N1cHBvcnQgPSBmYWxzZTsKIAlkYy0+ZGVidWcgPSBk
ZWJ1Z19kZWZhdWx0czsKIAogCS8qKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqCi0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
YW1kLWdmeA==
