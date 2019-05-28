Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F9162C43B
	for <lists+amd-gfx@lfdr.de>; Tue, 28 May 2019 12:28:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D6886E1AA;
	Tue, 28 May 2019 10:28:32 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr810041.outbound.protection.outlook.com [40.107.81.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 909226E1AA
 for <amd-gfx@lists.freedesktop.org>; Tue, 28 May 2019 10:28:31 +0000 (UTC)
Received: from DM5PR12CA0064.namprd12.prod.outlook.com (10.175.83.154) by
 DM5PR12MB1276.namprd12.prod.outlook.com (10.168.239.146) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1922.17; Tue, 28 May 2019 10:28:30 +0000
Received: from DM3NAM03FT023.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::203) by DM5PR12CA0064.outlook.office365.com
 (2603:10b6:3:103::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1943.16 via Frontend
 Transport; Tue, 28 May 2019 10:28:29 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 DM3NAM03FT023.mail.protection.outlook.com (10.152.82.205) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.1922.16 via Frontend Transport; Tue, 28 May 2019 10:28:29 +0000
Received: from build-machine.amd.com (10.34.1.3) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Tue, 28 May 2019
 05:28:28 -0500
From: Emily Deng <Emily.Deng@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amdgpu/display: Fix reload driver error
Date: Tue, 28 May 2019 18:28:23 +0800
Message-ID: <1559039303-30239-1-git-send-email-Emily.Deng@amd.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(396003)(346002)(39860400002)(136003)(376002)(2980300002)(428003)(199004)(189003)(48376002)(478600001)(68736007)(305945005)(8676002)(476003)(186003)(126002)(316002)(50226002)(72206003)(2616005)(51416003)(4326008)(2351001)(16586007)(53936002)(50466002)(486006)(7696005)(2906002)(36756003)(336012)(26005)(70206006)(47776003)(86362001)(8936002)(70586007)(6666004)(81166006)(356004)(77096007)(6916009)(81156014)(53416004)(5660300002)(426003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1276; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 15da8265-80f0-4033-da17-08d6e3573a24
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328);
 SRVR:DM5PR12MB1276; 
X-MS-TrafficTypeDiagnostic: DM5PR12MB1276:
X-Microsoft-Antispam-PRVS: <DM5PR12MB127628E9606F354B7484FE418F1E0@DM5PR12MB1276.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2043;
X-Forefront-PRVS: 00514A2FE6
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: irO0vk8roqmeq8iTO/ARAXAwuTkfSUf1rOZqEvRN9yNiQFcXjbDn7GN4d1XoHuNJlMMaJ2rPW5uXm0UF/EaWOsX2K4mjdaaRiKhNvqG77MOF+d+qZGATaCUZ06oCnhN1YiKV3uxnHWlKCy+6AHVK3Qond3j+a2Y1b4jNXk1ls+6gszA9Jy2sMx3ivSIzh/nhGIAHrZNZ222eRfYmr+oFqtNBILZK/PIVKk1K5C/jFUA0Kp34OudzCQObdW75W6tFESMCzOvhIcJTg+f8f8fGDYI8XeO4gyodEschfRKTGO/XDjuXQc1b6fq15V+Kdcivnk/nLHWABM9SaaoQfe+i520REeGAHM41r33mKMx0qnDkCcaAVzu5MWMJUgH1/ZB2DvkEbFmVPoceei1kjMSGrLiVdY+hr9TWLqC5r2//Ur4=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2019 10:28:29.5496 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 15da8265-80f0-4033-da17-08d6e3573a24
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1276
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RCc0gcA76i9kmZEh5UtsRYrdU8qLHXwrF9c4q1NcjC4=;
 b=wQDSYRtvQdssmTMhdXFQ3XCozJ4S+cszwfThYLmS0c0Wvf36WSIEQQBKzmRHpVUz/VDQKZpbzBm5fOcahv4fOPlZrkWk8++ayTdUOkl+cz8I6CHPc0uhNHDHlv9H/4Cb3LG7+DKlNGfUWFXWnpxBIDIrLvfiuWL+2aVDWe8uMXk=
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
Cc: Emily Deng <Emily.Deng@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

SXNzdWU6CldpbGwgaGF2ZSBmb2xsb3cgZXJyb3Igd2hlbiByZWxvYWQgZHJpdmVyOgpbIDM5ODYu
NTY3NzM5XSBzeXNmczogY2Fubm90IGNyZWF0ZSBkdXBsaWNhdGUgZmlsZW5hbWUgJy9kZXZpY2Vz
L3BjaTAwMDA6MDAvMDAwMDowMDowNy4wL2RybV9kcF9hdXhfZGV2JwpbIDM5ODYuNTY3NzQzXSBD
UFU6IDYgUElEOiAxNzY3IENvbW06IG1vZHByb2JlIFRhaW50ZWQ6IEcgICAgICAgICAgIE9FICAg
ICA1LjAuMC1yYzEtY3VzdG9tICMxClsgMzk4Ni41Njc3NDVdIEhhcmR3YXJlIG5hbWU6IFFFTVUg
U3RhbmRhcmQgUEMgKGk0NDBGWCArIFBJSVgsIDE5OTYpLCBCSU9TIFVidW50dS0xLjguMi0xdWJ1
bnR1MSAwNC8wMS8yMDE0ClsgMzk4Ni41Njc3NDZdIENhbGwgVHJhY2U6Ci4uLi4uLgpbIDM5ODYu
NTY3ODA4XSAgZHJtX2RwX2F1eF9yZWdpc3Rlcl9kZXZub2RlKzB4ZGMvMHgxNDAgW2RybV9rbXNf
aGVscGVyXQouLi4uLi4KWyAzOTg2LjU2OTA4MV0ga29iamVjdF9hZGRfaW50ZXJuYWwgZmFpbGVk
IGZvciBkcm1fZHBfYXV4X2RldiB3aXRoIC1FRVhJU1QsIGRvbid0IHRyeSB0byByZWdpc3RlciB0
aGluZ3Mgd2l0aCB0aGUgc2FtZSBuYW1lIGluIHRoZSBzYW1lIGRpcmVjdG9yeS4KClJlcHJvZHVj
ZSBzZXF1ZW5jZXM6CjEubW9kcHJvYmUgYW1kZ3B1CjIubW9kcHJvYmUgLXIgYW1kZ3B1CjMubW9k
cHJvYmUgYW1kZ3B1CgpSb290IGNhdXNlOgpXaGVuIHVubG9hZCBkcml2ZXIsIGl0IGRvbid0IHVu
cmVnaXN0ZXIgYXV4LgoKU2lnbmVkLW9mZi1ieTogRW1pbHkgRGVuZyA8RW1pbHkuRGVuZ0BhbWQu
Y29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9tb2RlLmggICAgICAg
ICAgICAgICB8ICAxICsKIGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1k
Z3B1X2RtLmMgICAgICB8IDE4ICsrKysrKysrKysrKysrKysrLQogLi4uL2RybS9hbWQvZGlzcGxh
eS9hbWRncHVfZG0vYW1kZ3B1X2RtX21zdF90eXBlcy5jICAgIHwgIDYgKysrKystCiAzIGZpbGVz
IGNoYW5nZWQsIDIzIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X21vZGUuaCBiL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L2FtZGdwdV9tb2RlLmgKaW5kZXggZTQ4ZmQzNS4uNzIwOTU1YiAxMDA2NDQK
LS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X21vZGUuaAorKysgYi9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfbW9kZS5oCkBAIC01MjUsNiArNTI1LDcgQEAg
ZW51bSBhbWRncHVfY29ubmVjdG9yX2RpdGhlciB7CiBzdHJ1Y3QgYW1kZ3B1X2RtX2RwX2F1eCB7
CiAJc3RydWN0IGRybV9kcF9hdXggYXV4OwogCXN0cnVjdCBkZGNfc2VydmljZSAqZGRjX3NlcnZp
Y2U7CisJYm9vbCBoYXNfYXV4OwogfTsKIAogc3RydWN0IGFtZGdwdV9pMmNfYWRhcHRlciB7CmRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9k
bS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uYwpp
bmRleCA4ZmUxNjg1Li5kZTM2OWFlIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rp
c3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlz
cGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmMKQEAgLTM3NjAsNiArMzc2MCwxNiBAQCBpbnQgYW1k
Z3B1X2RtX2Nvbm5lY3Rvcl9hdG9taWNfZ2V0X3Byb3BlcnR5KHN0cnVjdCBkcm1fY29ubmVjdG9y
ICpjb25uZWN0b3IsCiAJcmV0dXJuIHJldDsKIH0KIAorc3RhdGljIHZvaWQgYW1kZ3B1X2RtX2Nv
bm5lY3Rvcl91bnJlZ2lzdGVyKHN0cnVjdCBkcm1fY29ubmVjdG9yICpjb25uZWN0b3IpCit7CisJ
c3RydWN0IGFtZGdwdV9kbV9jb25uZWN0b3IgKmFtZGdwdV9kbV9jb25uZWN0b3IgPSB0b19hbWRn
cHVfZG1fY29ubmVjdG9yKGNvbm5lY3Rvcik7CisKKwlpZiAoYW1kZ3B1X2RtX2Nvbm5lY3Rvci0+
ZG1fZHBfYXV4Lmhhc19hdXgpIHsKKwkJZHJtX2RwX2F1eF91bnJlZ2lzdGVyKCZhbWRncHVfZG1f
Y29ubmVjdG9yLT5kbV9kcF9hdXguYXV4KTsKKwkJYW1kZ3B1X2RtX2Nvbm5lY3Rvci0+ZG1fZHBf
YXV4Lmhhc19hdXggPSBmYWxzZTsKKwl9Cit9CisKIHN0YXRpYyB2b2lkIGFtZGdwdV9kbV9jb25u
ZWN0b3JfZGVzdHJveShzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAqY29ubmVjdG9yKQogewogCXN0cnVj
dCBhbWRncHVfZG1fY29ubmVjdG9yICphY29ubmVjdG9yID0gdG9fYW1kZ3B1X2RtX2Nvbm5lY3Rv
cihjb25uZWN0b3IpOwpAQCAtMzc4OCw2ICszNzk4LDExIEBAIHN0YXRpYyB2b2lkIGFtZGdwdV9k
bV9jb25uZWN0b3JfZGVzdHJveShzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAqY29ubmVjdG9yKQogCWRy
bV9kcF9jZWNfdW5yZWdpc3Rlcl9jb25uZWN0b3IoJmFjb25uZWN0b3ItPmRtX2RwX2F1eC5hdXgp
OwogCWRybV9jb25uZWN0b3JfdW5yZWdpc3Rlcihjb25uZWN0b3IpOwogCWRybV9jb25uZWN0b3Jf
Y2xlYW51cChjb25uZWN0b3IpOworCWlmIChhY29ubmVjdG9yLT5pMmMpIHsKKwkJaTJjX2RlbF9h
ZGFwdGVyKCZhY29ubmVjdG9yLT5pMmMtPmJhc2UpOworCQlrZnJlZShhY29ubmVjdG9yLT5pMmMp
OworCX0KKwogCWtmcmVlKGNvbm5lY3Rvcik7CiB9CiAKQEAgLTM4NDYsNyArMzg2MSw4IEBAIHN0
YXRpYyBjb25zdCBzdHJ1Y3QgZHJtX2Nvbm5lY3Rvcl9mdW5jcyBhbWRncHVfZG1fY29ubmVjdG9y
X2Z1bmNzID0gewogCS5hdG9taWNfZHVwbGljYXRlX3N0YXRlID0gYW1kZ3B1X2RtX2Nvbm5lY3Rv
cl9hdG9taWNfZHVwbGljYXRlX3N0YXRlLAogCS5hdG9taWNfZGVzdHJveV9zdGF0ZSA9IGRybV9h
dG9taWNfaGVscGVyX2Nvbm5lY3Rvcl9kZXN0cm95X3N0YXRlLAogCS5hdG9taWNfc2V0X3Byb3Bl
cnR5ID0gYW1kZ3B1X2RtX2Nvbm5lY3Rvcl9hdG9taWNfc2V0X3Byb3BlcnR5LAotCS5hdG9taWNf
Z2V0X3Byb3BlcnR5ID0gYW1kZ3B1X2RtX2Nvbm5lY3Rvcl9hdG9taWNfZ2V0X3Byb3BlcnR5CisJ
LmF0b21pY19nZXRfcHJvcGVydHkgPSBhbWRncHVfZG1fY29ubmVjdG9yX2F0b21pY19nZXRfcHJv
cGVydHksCisJLmVhcmx5X3VucmVnaXN0ZXIgPSBhbWRncHVfZG1fY29ubmVjdG9yX3VucmVnaXN0
ZXIKIH07CiAKIHN0YXRpYyBpbnQgZ2V0X21vZGVzKHN0cnVjdCBkcm1fY29ubmVjdG9yICpjb25u
ZWN0b3IpCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2Rt
L2FtZGdwdV9kbV9tc3RfdHlwZXMuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRn
cHVfZG0vYW1kZ3B1X2RtX21zdF90eXBlcy5jCmluZGV4IDZlMjA1ZWUuLjE5MGU5MmMgMTAwNjQ0
Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtX21z
dF90eXBlcy5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1k
Z3B1X2RtX21zdF90eXBlcy5jCkBAIC0zODcsMTIgKzM4NywxNiBAQCBzdGF0aWMgY29uc3Qgc3Ry
dWN0IGRybV9kcF9tc3RfdG9wb2xvZ3lfY2JzIGRtX21zdF9jYnMgPSB7CiB2b2lkIGFtZGdwdV9k
bV9pbml0aWFsaXplX2RwX2Nvbm5lY3RvcihzdHJ1Y3QgYW1kZ3B1X2Rpc3BsYXlfbWFuYWdlciAq
ZG0sCiAJCQkJICAgICAgIHN0cnVjdCBhbWRncHVfZG1fY29ubmVjdG9yICphY29ubmVjdG9yKQog
eworCWludCByZXQ7CiAJYWNvbm5lY3Rvci0+ZG1fZHBfYXV4LmF1eC5uYW1lID0gImRtZGMiOwog
CWFjb25uZWN0b3ItPmRtX2RwX2F1eC5hdXguZGV2ID0gZG0tPmFkZXYtPmRldjsKIAlhY29ubmVj
dG9yLT5kbV9kcF9hdXguYXV4LnRyYW5zZmVyID0gZG1fZHBfYXV4X3RyYW5zZmVyOwogCWFjb25u
ZWN0b3ItPmRtX2RwX2F1eC5kZGNfc2VydmljZSA9IGFjb25uZWN0b3ItPmRjX2xpbmstPmRkYzsK
IAotCWRybV9kcF9hdXhfcmVnaXN0ZXIoJmFjb25uZWN0b3ItPmRtX2RwX2F1eC5hdXgpOworCXJl
dCA9IGRybV9kcF9hdXhfcmVnaXN0ZXIoJmFjb25uZWN0b3ItPmRtX2RwX2F1eC5hdXgpOworCWlm
ICghcmV0KQorCQlhY29ubmVjdG9yLT5kbV9kcF9hdXguaGFzX2F1eCA9IHRydWU7CisKIAlkcm1f
ZHBfY2VjX3JlZ2lzdGVyX2Nvbm5lY3RvcigmYWNvbm5lY3Rvci0+ZG1fZHBfYXV4LmF1eCwKIAkJ
CQkgICAgICBhY29ubmVjdG9yLT5iYXNlLm5hbWUsIGRtLT5hZGV2LT5kZXYpOwogCWFjb25uZWN0
b3ItPm1zdF9tZ3IuY2JzID0gJmRtX21zdF9jYnM7Ci0tIAoyLjcuNAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1k
LWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
