Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C9FA8738F
	for <lists+amd-gfx@lfdr.de>; Fri,  9 Aug 2019 09:58:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0A296ED07;
	Fri,  9 Aug 2019 07:58:14 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr790072.outbound.protection.outlook.com [40.107.79.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF2456ED07
 for <amd-gfx@lists.freedesktop.org>; Fri,  9 Aug 2019 07:58:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A83g8QBI8W2zSmTMgOviWXIDxJb4j9JmA3rHipd6FZz467evB/juPvJ6AGSAWev/rB9bxs/N4Im/IMKcIv+8mteh+62HweoLzu2oYVAXZT3AJVV7duY5DUmRgLpniabKCTLdfjNkNsZ+rHB5jAZOhszBPtlgw/jprtsJDxyxBZzF1LHG3OsyUCp9Qkf1DCrPlTZ1HEoUeI4azAwKCQaoW1ZcBFgHdB89KU+L1PUQl+kZsthZwgGqM5y1Um0yDA1mqPckBF9ehTu+yYZvqINs5hjwVQmdXbegpvFoQzDN7TeDeCTRUgG8UCGYK7RT4mQgwt7lvFZSe3TszfhBDCnzWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0HFjSALqtTwCJHAN7ChQX9I2C0nO1EJvH0vSi0UrmX0=;
 b=iVfL3WLKn1fS+h5xNVDlIKnvbTmYyv4c8f/jC1Xb9RYdWvSC0obhbkW8qRudh4ZDCCF+UpJ5rjwR/jt6pYujl57hGDurPfv06eO1J0BG87ue3HAix+90aQhYHL15iZAXa0Y+oyR9KbHi++jj8WhiOggGq9EQ2X0pDSny/9lvCngfWzb5MCIGZQwIWppQMdfr034BOzs+4FTcJIhcnoOMHXPIXY7Eekg6PR4SB7xzqbn/Mk1Z4EPy3wNPCjtfLM148zoEmWRYVD5emJTQ2MzsM7RVpbuXxdnCiI/6qvR+N1kNXpBE5Rl6DLulccAsh3jwCl/Y1/l/je9Ygg+MqnqagA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=amd.com;dmarc=permerror action=none
 header.from=amd.com;dkim=none (message not signed);arc=none
Received: from DM3PR12CA0118.namprd12.prod.outlook.com (2603:10b6:0:51::14) by
 CY4PR12MB1528.namprd12.prod.outlook.com (2603:10b6:910:6::23) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2136.17; Fri, 9 Aug 2019 07:58:10 +0000
Received: from BY2NAM03FT030.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::203) by DM3PR12CA0118.outlook.office365.com
 (2603:10b6:0:51::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2157.16 via Frontend
 Transport; Fri, 9 Aug 2019 07:58:10 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 BY2NAM03FT030.mail.protection.outlook.com (10.152.84.214) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2157.15 via Frontend Transport; Fri, 9 Aug 2019 07:58:09 +0000
Received: from taozhou1u2.amd.com (10.34.1.3) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Fri, 9 Aug 2019
 02:58:08 -0500
From: Tao Zhou <tao.zhou1@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <alexander.deucher@amd.com>,
 <hawking.zhang@amd.com>, <christian.koenig@amd.com>
Subject: [PATCH 2/2] drm/amdgpu: remove RREG64/WREG64
Date: Fri, 9 Aug 2019 15:57:51 +0800
Message-ID: <20190809075751.5078-2-tao.zhou1@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190809075751.5078-1-tao.zhou1@amd.com>
References: <20190809075751.5078-1-tao.zhou1@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(39860400002)(346002)(136003)(376002)(2980300002)(428003)(189003)(199004)(186003)(426003)(1076003)(76176011)(336012)(81156014)(81166006)(2906002)(6666004)(356004)(53936002)(50226002)(7696005)(47776003)(6636002)(51416003)(305945005)(316002)(36756003)(16586007)(8936002)(110136005)(478600001)(2201001)(4326008)(26005)(446003)(8676002)(5660300002)(11346002)(476003)(486006)(126002)(53416004)(50466002)(86362001)(70206006)(70586007)(2616005)(48376002)(2101003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR12MB1528; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: aaa0fe49-092a-4b78-0b81-08d71c9f5211
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:CY4PR12MB1528; 
X-MS-TrafficTypeDiagnostic: CY4PR12MB1528:
X-Microsoft-Antispam-PRVS: <CY4PR12MB152800BFE890A1DB64C6C88BB0D60@CY4PR12MB1528.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:595;
X-Forefront-PRVS: 01244308DF
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: FvdASdrtqsRF0WlYkfl7L5JH0A6hh67AMsGpmJ9jdtkkt10rWalkRoGRrCDiP3OBjQn3Dlxung19oSZbjDDqWL1H0QsA84xNa35xpJtaH0bCEMrJnEuRTqswbI4EtUCrLNmAYzdNMHgST+JnjZpCwQIsc3OqFnJNdWweCMwOPpcj/Fg7Rf9yVZ7yPkicxkbiseYRqllnH/rrJ0PSUlAuNQUfLaR9kqRX5P2bPERey5GkAtK629C8/5GHKNFCol4PMxM7deBVkc8zybM3iY69LBL9eybMQQ2BhNY3+ie0TrA2EjlqkOqraTbSuXHD9kX+8AriGIRuFSoNvz6X7+y7fQJNBBbuCkxAu5X9wNi59AaPQSa9gxdS7tWZwZe7U1EmmvdhUyu/kvXadVVo0eXSKzBq/+VeV5CvuoX2Gib/R+Q=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2019 07:58:09.7074 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: aaa0fe49-092a-4b78-0b81-08d71c9f5211
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1528
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0HFjSALqtTwCJHAN7ChQX9I2C0nO1EJvH0vSi0UrmX0=;
 b=N7xmqrBMWz80LJBtDOxboBgi9rgFlcUckRcScoQBFcATVgEUdH9dD0yR382kM3QC6jpggcobXg3eRTnIwTo73Y1TUEzRtCndOA9vuyOD7XfZyAEK7xsDaZUFtIf9AIJAFZQ0q7ivu2bbFcdR3m8KrqdwZQeRLDpaIjD8AAlRr+c=
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
Cc: Tao Zhou <tao.zhou1@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

YXRvbWljIDY0IGJpdHMgUkVHIG9wZXJhdGlvbnMgYXJlIHVzZWxlc3MgY3VycmVudGx5CgpTaWdu
ZWQtb2ZmLWJ5OiBUYW8gWmhvdSA8dGFvLnpob3UxQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvYW1kZ3B1LmggICAgICAgIHwgIDQgLS0tCiBkcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9hbWRncHVfZGV2aWNlLmMgfCAzMyAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tCiAy
IGZpbGVzIGNoYW5nZWQsIDM3IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L2FtZGdwdS5oIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1k
Z3B1LmgKaW5kZXggZWQxYTIxN2U4NmU0Li5mNmFlNTY1MmIyZTUgMTAwNjQ0Ci0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdS5oCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L2FtZGdwdS5oCkBAIC0xMDQyLDggKzEwNDIsNiBAQCB2b2lkIGFtZGdwdV9tbV93cmVn
KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LCB1aW50MzJfdCByZWcsIHVpbnQzMl90IHYsCiAJ
CSAgICB1aW50MzJfdCBhY2NfZmxhZ3MpOwogdm9pZCBhbWRncHVfbW1fd3JlZzgoc3RydWN0IGFt
ZGdwdV9kZXZpY2UgKmFkZXYsIHVpbnQzMl90IG9mZnNldCwgdWludDhfdCB2YWx1ZSk7CiB1aW50
OF90IGFtZGdwdV9tbV9ycmVnOChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwgdWludDMyX3Qg
b2Zmc2V0KTsKLXVpbnQ2NF90IGFtZGdwdV9tbV9ycmVnNjQoc3RydWN0IGFtZGdwdV9kZXZpY2Ug
KmFkZXYsIHVpbnQzMl90IHJlZyk7Ci12b2lkIGFtZGdwdV9tbV93cmVnNjQoc3RydWN0IGFtZGdw
dV9kZXZpY2UgKmFkZXYsIHVpbnQzMl90IHJlZywgdWludDY0X3Qgdik7CiAKIHUzMiBhbWRncHVf
aW9fcnJlZyhzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwgdTMyIHJlZyk7CiB2b2lkIGFtZGdw
dV9pb193cmVnKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LCB1MzIgcmVnLCB1MzIgdik7CkBA
IC0xMDcxLDggKzEwNjksNiBAQCBpbnQgZW11X3NvY19hc2ljX2luaXQoc3RydWN0IGFtZGdwdV9k
ZXZpY2UgKmFkZXYpOwogI2RlZmluZSBEUkVHMzIocmVnKSBwcmludGsoS0VSTl9JTkZPICJSRUdJ
U1RFUjogIiAjcmVnICIgOiAweCUwOFhcbiIsIGFtZGdwdV9tbV9ycmVnKGFkZXYsIChyZWcpLCAw
KSkKICNkZWZpbmUgV1JFRzMyKHJlZywgdikgYW1kZ3B1X21tX3dyZWcoYWRldiwgKHJlZyksICh2
KSwgMCkKICNkZWZpbmUgV1JFRzMyX0lEWChyZWcsIHYpIGFtZGdwdV9tbV93cmVnKGFkZXYsIChy
ZWcpLCAodiksIEFNREdQVV9SRUdTX0lEWCkKLSNkZWZpbmUgUlJFRzY0KHJlZykgYW1kZ3B1X21t
X3JyZWc2NChhZGV2LCAocmVnKSkKLSNkZWZpbmUgV1JFRzY0KHJlZywgdikgYW1kZ3B1X21tX3dy
ZWc2NChhZGV2LCAocmVnKSwgKHYpKQogI2RlZmluZSBSRUdfU0VUKEZJRUxELCB2KSAoKCh2KSA8
PCBGSUVMRCMjX1NISUZUKSAmIEZJRUxEIyNfTUFTSykKICNkZWZpbmUgUkVHX0dFVChGSUVMRCwg
dikgKCgodikgPDwgRklFTEQjI19TSElGVCkgJiBGSUVMRCMjX01BU0spCiAjZGVmaW5lIFJSRUcz
Ml9QQ0lFKHJlZykgYWRldi0+cGNpZV9ycmVnKGFkZXYsIChyZWcpKQpkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RldmljZS5jIGIvZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvYW1kZ3B1X2RldmljZS5jCmluZGV4IDdlYjllMGI5MjM1YS4uMmY0M2M1OGY1
ZDAzIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGV2aWNl
LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RldmljZS5jCkBAIC0y
NjIsMzkgKzI2Miw2IEBAIHZvaWQgYW1kZ3B1X21tX3dyZWcoc3RydWN0IGFtZGdwdV9kZXZpY2Ug
KmFkZXYsIHVpbnQzMl90IHJlZywgdWludDMyX3QgdiwKIAl9CiB9CiAKLS8qKgotICogYW1kZ3B1
X21tX3JyZWc2NCAtIHJlYWQgYSA2NCBiaXQgbWVtb3J5IG1hcHBlZCBJTyByZWdpc3RlcgotICoK
LSAqIEBhZGV2OiBhbWRncHVfZGV2aWNlIHBvaW50ZXIKLSAqIEByZWc6IGR3b3JkIGFsaWduZWQg
cmVnaXN0ZXIgb2Zmc2V0Ci0gKgotICogUmV0dXJucyB0aGUgNjQgYml0IHZhbHVlIGZyb20gdGhl
IG9mZnNldCBzcGVjaWZpZWQuCi0gKi8KLXVpbnQ2NF90IGFtZGdwdV9tbV9ycmVnNjQoc3RydWN0
IGFtZGdwdV9kZXZpY2UgKmFkZXYsIHVpbnQzMl90IHJlZykKLXsKLQlpZiAoKHJlZyAqIDQpIDwg
YWRldi0+cm1taW9fc2l6ZSkKLQkJcmV0dXJuIGF0b21pYzY0X3JlYWQoKGF0b21pYzY0X3QgKiko
YWRldi0+cm1taW8gKyAocmVnICogNCkpKTsKLQllbHNlCi0JCUJVRygpOwotfQotCi0vKioKLSAq
IGFtZGdwdV9tbV93cmVnNjQgLSB3cml0ZSB0byBhIDY0IGJpdCBtZW1vcnkgbWFwcGVkIElPIHJl
Z2lzdGVyCi0gKgotICogQGFkZXY6IGFtZGdwdV9kZXZpY2UgcG9pbnRlcgotICogQHJlZzogZHdv
cmQgYWxpZ25lZCByZWdpc3RlciBvZmZzZXQKLSAqIEB2OiA2NCBiaXQgdmFsdWUgdG8gd3JpdGUg
dG8gdGhlIHJlZ2lzdGVyCi0gKgotICogV3JpdGVzIHRoZSB2YWx1ZSBzcGVjaWZpZWQgdG8gdGhl
IG9mZnNldCBzcGVjaWZpZWQuCi0gKi8KLXZvaWQgYW1kZ3B1X21tX3dyZWc2NChzdHJ1Y3QgYW1k
Z3B1X2RldmljZSAqYWRldiwgdWludDMyX3QgcmVnLCB1aW50NjRfdCB2KQotewotCWlmICgocmVn
ICogNCkgPCBhZGV2LT5ybW1pb19zaXplKQotCQlhdG9taWM2NF9zZXQoKGF0b21pYzY0X3QgKiko
YWRldi0+cm1taW8gKyAocmVnICogNCkpLCB2KTsKLQllbHNlCi0JCUJVRygpOwotfQotCiAvKioK
ICAqIGFtZGdwdV9pb19ycmVnIC0gcmVhZCBhbiBJTyByZWdpc3RlcgogICoKLS0gCjIuMTcuMQoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
