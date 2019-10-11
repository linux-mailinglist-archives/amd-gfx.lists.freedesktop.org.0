Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3FECD3E00
	for <lists+amd-gfx@lfdr.de>; Fri, 11 Oct 2019 13:10:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 221B16EC17;
	Fri, 11 Oct 2019 11:10:41 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700080.outbound.protection.outlook.com [40.107.70.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F16246EC14
 for <amd-gfx@lists.freedesktop.org>; Fri, 11 Oct 2019 11:10:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=daIysOPblzbGqRI9UOYlLwmovbyo4OTdBwwJuz2xEB3Q8R9TVigkMzLQ5jy+dCKijEK6TNUhubj+0yIeT09MwdzIvrt1KZqEne7m7aJ8PGjTgw8aOu5XSR5LNBv1TVlbp8VMFYKRWK+ncqNCiZSX8++vlVJHPxuITWIvzMM9JrBMHCOzBdbxk2TumrpfDNsCDGGiRWudabmkRMxqueuLM4ox17FXP4pw3mznN8LXghHHS+BVlg6m+yQAcsipwRQoXGeRCGvZXR1P7smWEXXQCLQPmz4JXBgVcPysCylN9jtLcb4rj916gXloYkhh1FJMHfVpLBIUYtb+w8PKt4wnQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D9+M4jOwkfQ6SwIxuwBBaeaqmTT9ITFA5E82hn/E+TY=;
 b=jiMabCxYddCsDUmJfPF9/4bI38DOtM4mxOoGIuZCF0qqnpkYPUGjJE4IeOput0nfJ8n25FVZZTjD7H6mTW46QxFFh40YZ/x1Y21mQUTuUEwEIxGyheUvd2OWG1Z2LjCU8uIED3XoN1VaQDrZVDQtR1dS7EaRXQOclOeccbdwEzE8ZwUhJbYlbsM0fFzbYbjehdaF1TD+6PwjS2v2YhGUThZEv84N0m08oBtcPLJHHEBdxoRwlN4Fah6fnD6OsecqmnuaOJfykPHP66RtXLzkZEOEeyooYn1puwtA1fY/Dmr/zGhX8KJ2WT+mqA8xJxiO/p5LO/3dtbbcqu0mphJlGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from DM5PR12CA0006.namprd12.prod.outlook.com (2603:10b6:4:1::16) by
 MN2PR12MB3008.namprd12.prod.outlook.com (2603:10b6:208:c8::17) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.19; Fri, 11 Oct 2019 11:10:36 +0000
Received: from BY2NAM03FT046.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::204) by DM5PR12CA0006.outlook.office365.com
 (2603:10b6:4:1::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.16 via Frontend
 Transport; Fri, 11 Oct 2019 11:10:35 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 BY2NAM03FT046.mail.protection.outlook.com (10.152.85.84) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2327.20 via Frontend Transport; Fri, 11 Oct 2019 11:10:35 +0000
Received: from localhost.localdomain (10.180.168.240) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1;
 Fri, 11 Oct 2019 06:10:31 -0500
From: Le Ma <le.ma@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 1/4] drm/amdgpu/soc15: disable doorbell interrupt as part of
 BACO entry sequence
Date: Fri, 11 Oct 2019 19:10:25 +0800
Message-ID: <1570792228-11189-1-git-send-email-le.ma@amd.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(396003)(39860400002)(376002)(346002)(428003)(189003)(199004)(6666004)(47776003)(48376002)(50466002)(8936002)(2906002)(356004)(36756003)(50226002)(14444005)(2616005)(426003)(316002)(4326008)(51416003)(336012)(8676002)(5660300002)(86362001)(6916009)(478600001)(486006)(26005)(81156014)(81166006)(44832011)(186003)(16586007)(2351001)(476003)(70586007)(126002)(70206006)(305945005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3008; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0cc12591-32aa-4c43-cad1-08d74e3ba406
X-MS-TrafficTypeDiagnostic: MN2PR12MB3008:
X-Microsoft-Antispam-PRVS: <MN2PR12MB3008326B589C9D09A254F025F6970@MN2PR12MB3008.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1824;
X-Forefront-PRVS: 0187F3EA14
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JoIiMOdb0yQZ84CkuS/Cpe6DjRmNOvCc/rn4K8avhctdv6GAwpPki5AJ0RJ5ZBgyVGmlca6x6Bc6RQMrP+HcvzuCGqamHNBGHVye3bP9GbnA1e5H9Xnrd4PLacyB3KHEhOec/fiGDeTAP/oHAPwyHq3n5OuaYms55jQSCpSROArstA+pUjBW0jKhGRdMdMnprJbgZ/rPlaZd9F1s5pwiFWrXPx59gevucTMq7ojz5Wqgqj3Er9qLzPRBOShyrTg2VvpnzAPO4vv5QcLosTMQC1Tx/xOv7gkFpdHhCcJJc3kgeevgBqykAyfNVTXGrT6jFeBB+EdvAZ7TjVacGrjhcU3MOGT+WFgTGmrKayXKlaL01eTMBZYu8Pl7fD3GLhFXzsFif0tJHsgCoYM1cjwbKqnqNfWw0/gNmJ71SLE2En4=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2019 11:10:35.6508 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0cc12591-32aa-4c43-cad1-08d74e3ba406
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3008
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D9+M4jOwkfQ6SwIxuwBBaeaqmTT9ITFA5E82hn/E+TY=;
 b=t7mF9KQ87sngA+v0SbJ0F5R3NOlHGRABA1kw9HsLD1RC9I0HrFmNWeT7CyJh3BqkeW9kXNdPwoiAe5YrZ/m93qVa5WgmrVwgJ92duhuiS4Q7IhUFgSDY6UrroPaIyd/UZeHqr2gqepDGDqLVjS3fM5gHU5xaV51Bu5G3omzj5J8=
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
Cc: Le Ma <le.ma@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

V29ya2Fyb3VuZCB0byBtYWtlIFJBUyByZWNvdmVyeSB3b3JrIGluIEJBQ08gcmVzZXQuCgpDaGFu
Z2UtSWQ6IEk0ZTRhODFmNzE5ZGNjODhkZmQ0OWY1ODNjNGJlM2EzNzNiNWVhYjJjClNpZ25lZC1v
ZmYtYnk6IExlIE1hIDxsZS5tYUBhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2FtZGdwdV9uYmlvLmggfCAyICsrCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9uYmlv
X3Y3XzQuYyAgIHwgOCArKysrKysrKwogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvc29jMTUu
YyAgICAgICB8IDkgKysrKysrKysrCiAzIGZpbGVzIGNoYW5nZWQsIDE5IGluc2VydGlvbnMoKykK
CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfbmJpby5oIGIv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X25iaW8uaAppbmRleCAxZjI2YTE3Li45
MTliZDU2IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfbmJp
by5oCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9uYmlvLmgKQEAgLTY3
LDYgKzY3LDggQEAgc3RydWN0IGFtZGdwdV9uYmlvX2Z1bmNzIHsKIAkJCQkJCSAgYm9vbCBlbmFi
bGUpOwogCXZvaWQgKCppaF9kb29yYmVsbF9yYW5nZSkoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFk
ZXYsCiAJCQkJICBib29sIHVzZV9kb29yYmVsbCwgaW50IGRvb3JiZWxsX2luZGV4KTsKKwl2b2lk
ICgqZW5hYmxlX2Rvb3JiZWxsX2ludGVycnVwdCkoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYs
CisJCQkJCSAgYm9vbCBlbmFibGUpOwogCXZvaWQgKCp1cGRhdGVfbWVkaXVtX2dyYWluX2Nsb2Nr
X2dhdGluZykoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsCiAJCQkJCQkgYm9vbCBlbmFibGUp
OwogCXZvaWQgKCp1cGRhdGVfbWVkaXVtX2dyYWluX2xpZ2h0X3NsZWVwKShzdHJ1Y3QgYW1kZ3B1
X2RldmljZSAqYWRldiwKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L25i
aW9fdjdfNC5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvbmJpb192N180LmMKaW5kZXgg
MjM4YzI0OC4uMGRiNDU4ZiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
bmJpb192N180LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvbmJpb192N180LmMK
QEAgLTUwMiw2ICs1MDIsMTMgQEAgc3RhdGljIHZvaWQgbmJpb192N180X3F1ZXJ5X3Jhc19lcnJv
cl9jb3VudChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwKIAl9CiB9CiAKK3N0YXRpYyB2b2lk
IG5iaW9fdjdfNF9lbmFibGVfZG9vcmJlbGxfaW50ZXJydXB0KHN0cnVjdCBhbWRncHVfZGV2aWNl
ICphZGV2LAorCQkJCQkJYm9vbCBlbmFibGUpCit7CisJV1JFRzMyX0ZJRUxEMTUoTkJJTywgMCwg
QklGX0RPT1JCRUxMX0lOVF9DTlRMLAorCQkgICAgICAgRE9PUkJFTExfSU5URVJSVVBUX0RJU0FC
TEUsIGVuYWJsZSA/IDAgOiAxKTsKK30KKwogY29uc3Qgc3RydWN0IGFtZGdwdV9uYmlvX2Z1bmNz
IG5iaW9fdjdfNF9mdW5jcyA9IHsKIAkuZ2V0X2hkcF9mbHVzaF9yZXFfb2Zmc2V0ID0gbmJpb192
N180X2dldF9oZHBfZmx1c2hfcmVxX29mZnNldCwKIAkuZ2V0X2hkcF9mbHVzaF9kb25lX29mZnNl
dCA9IG5iaW9fdjdfNF9nZXRfaGRwX2ZsdXNoX2RvbmVfb2Zmc2V0LApAQCAtNTE2LDYgKzUyMyw3
IEBAIGNvbnN0IHN0cnVjdCBhbWRncHVfbmJpb19mdW5jcyBuYmlvX3Y3XzRfZnVuY3MgPSB7CiAJ
LmVuYWJsZV9kb29yYmVsbF9hcGVydHVyZSA9IG5iaW9fdjdfNF9lbmFibGVfZG9vcmJlbGxfYXBl
cnR1cmUsCiAJLmVuYWJsZV9kb29yYmVsbF9zZWxmcmluZ19hcGVydHVyZSA9IG5iaW9fdjdfNF9l
bmFibGVfZG9vcmJlbGxfc2VsZnJpbmdfYXBlcnR1cmUsCiAJLmloX2Rvb3JiZWxsX3JhbmdlID0g
bmJpb192N180X2loX2Rvb3JiZWxsX3JhbmdlLAorCS5lbmFibGVfZG9vcmJlbGxfaW50ZXJydXB0
ID0gbmJpb192N180X2VuYWJsZV9kb29yYmVsbF9pbnRlcnJ1cHQsCiAJLnVwZGF0ZV9tZWRpdW1f
Z3JhaW5fY2xvY2tfZ2F0aW5nID0gbmJpb192N180X3VwZGF0ZV9tZWRpdW1fZ3JhaW5fY2xvY2tf
Z2F0aW5nLAogCS51cGRhdGVfbWVkaXVtX2dyYWluX2xpZ2h0X3NsZWVwID0gbmJpb192N180X3Vw
ZGF0ZV9tZWRpdW1fZ3JhaW5fbGlnaHRfc2xlZXAsCiAJLmdldF9jbG9ja2dhdGluZ19zdGF0ZSA9
IG5iaW9fdjdfNF9nZXRfY2xvY2tnYXRpbmdfc3RhdGUsCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9zb2MxNS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvc29j
MTUuYwppbmRleCBmYzZjZmJjLi41Y2Y1ZjExIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9zb2MxNS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3NvYzE1
LmMKQEAgLTQ5MywxMCArNDkzLDE1IEBAIHN0YXRpYyBpbnQgc29jMTVfYXNpY19iYWNvX3Jlc2V0
KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQogewogCXZvaWQgKnBwX2hhbmRsZSA9IGFkZXYt
PnBvd2VycGxheS5wcF9oYW5kbGU7CiAJY29uc3Qgc3RydWN0IGFtZF9wbV9mdW5jcyAqcHBfZnVu
Y3MgPSBhZGV2LT5wb3dlcnBsYXkucHBfZnVuY3M7CisJc3RydWN0IGFtZGdwdV9yYXMgKnJhcyA9
IGFtZGdwdV9yYXNfZ2V0X2NvbnRleHQoYWRldik7CiAKIAlpZiAoIXBwX2Z1bmNzIHx8IXBwX2Z1
bmNzLT5nZXRfYXNpY19iYWNvX3N0YXRlIHx8IXBwX2Z1bmNzLT5zZXRfYXNpY19iYWNvX3N0YXRl
KQogCQlyZXR1cm4gLUVOT0VOVDsKIAorCS8qIGF2b2lkIE5CSUYgZ290IHN0dWNrIHdoZW4gZG8g
UkFTIHJlY292ZXJ5IGluIEJBQ08gcmVzZXQgKi8KKwlpZiAocmFzICYmIHJhcy0+c3VwcG9ydGVk
KQorCQlhZGV2LT5uYmlvLmZ1bmNzLT5lbmFibGVfZG9vcmJlbGxfaW50ZXJydXB0KGFkZXYsIGZh
bHNlKTsKKwogCS8qIGVudGVyIEJBQ08gc3RhdGUgKi8KIAlpZiAocHBfZnVuY3MtPnNldF9hc2lj
X2JhY29fc3RhdGUocHBfaGFuZGxlLCAxKSkKIAkJcmV0dXJuIC1FSU87CkBAIC01MDUsNiArNTEw
LDEwIEBAIHN0YXRpYyBpbnQgc29jMTVfYXNpY19iYWNvX3Jlc2V0KHN0cnVjdCBhbWRncHVfZGV2
aWNlICphZGV2KQogCWlmIChwcF9mdW5jcy0+c2V0X2FzaWNfYmFjb19zdGF0ZShwcF9oYW5kbGUs
IDApKQogCQlyZXR1cm4gLUVJTzsKIAorCS8qIHJlLWVuYWJsZSBkb29yYmVsbCBpbnRlcnJ1cHQg
YWZ0ZXIgQkFDTyBleGl0ICovCisJaWYgKHJhcyAmJiByYXMtPnN1cHBvcnRlZCkKKwkJYWRldi0+
bmJpby5mdW5jcy0+ZW5hYmxlX2Rvb3JiZWxsX2ludGVycnVwdChhZGV2LCB0cnVlKTsKKwogCWRl
dl9pbmZvKGFkZXYtPmRldiwgIkdQVSBCQUNPIHJlc2V0XG4iKTsKIAogCWFkZXYtPmluX2JhY29f
cmVzZXQgPSAxOwotLSAKMi43LjQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1k
LWdmeA==
