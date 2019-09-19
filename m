Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CDEBEB7161
	for <lists+amd-gfx@lfdr.de>; Thu, 19 Sep 2019 04:04:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61F1D6F45F;
	Thu, 19 Sep 2019 02:04:50 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr730051.outbound.protection.outlook.com [40.107.73.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 993996F45F
 for <amd-gfx@lists.freedesktop.org>; Thu, 19 Sep 2019 02:04:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QD85P9cDnl/qS2BybPT/mUFgyy9UHcIbCYg9APzbIH9jAgDr+QMb23Bv4eXQdt//08GScP6jmUAwDWF+Z+qNmWw9mwr2JoWTOijn7gZNzKWnRr7eORNzwbFoR+cFGHSs1RVUUNx5hKoIewNanN0ZFkArvSLT4q/41qbuPAOYKssJ2Mig3CN39OxFjD4DKICIRu2pqYavX3Ik8A/hGo87S5DIGYxfz46fOh8n7h5iz/0bT8t41EKEjvVcAqY8sANLb+3EQZN69CqEN2H3fp41GfYxCSKDF6qfOSdrSshP448vkXJyzN3z4DLSKSS6ygSrAzHcfVCCEfQ8gQnC/A2CxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m1PyfKybWyDxU7bUUtSbGrbFU0lHOIZCLB4uMhci4cY=;
 b=Kc4tEIgfCjBam3mA4u3KJffX/Dlbh3UumjC3PDgaN6IWCi/k9zmPIQ3qR9PrPCjHhSbKJG0OEpqPKrEA5AB6VRc+ZooDc2uHHk+siF1sMhMNGdG/c0gJ0g3nVg+A6/DndU3sfCLbfkfZw5nn+snNM53HIDZHl72q+AWwqkCCo2XoJn3xkPLPnET/NuskxPHIe3O1my2NQ1XULmew/m0be29OTKzPnG3TSOQ1/Tn4jI8JjlNAU3YCKvspHEtI1VqGq95j88ATDxlSq6P9M918FxlTnBuIWO8YLQtCN/PFC5m9RcJo0ZU3netgGH+Rn7XhgUNTtWKpHGH21WnuQ25Ffw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from DM3PR12CA0064.namprd12.prod.outlook.com (2603:10b6:0:56::32) by
 BN6PR12MB1169.namprd12.prod.outlook.com (2603:10b6:404:19::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2263.21; Thu, 19 Sep 2019 02:04:46 +0000
Received: from BY2NAM03FT036.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::204) by DM3PR12CA0064.outlook.office365.com
 (2603:10b6:0:56::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2284.20 via Frontend
 Transport; Thu, 19 Sep 2019 02:04:46 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 BY2NAM03FT036.mail.protection.outlook.com (10.152.85.141) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2284.20 via Frontend Transport; Thu, 19 Sep 2019 02:04:46 +0000
Received: from rico-code.amd.com (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1; Wed, 18 Sep 2019
 21:04:40 -0500
From: Tianci Yin <tianci.yin@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amdgpu/gfx10: add support for wks firmware loading
Date: Thu, 19 Sep 2019 10:04:36 +0800
Message-ID: <20190919020436.17540-1-tianci.yin@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(346002)(376002)(39860400002)(396003)(428003)(199004)(189003)(8936002)(2616005)(51416003)(126002)(5660300002)(476003)(7696005)(47776003)(50466002)(36756003)(44832011)(16586007)(2906002)(6666004)(426003)(316002)(356004)(336012)(305945005)(1076003)(54906003)(6916009)(86362001)(478600001)(486006)(48376002)(81156014)(8676002)(81166006)(2351001)(186003)(50226002)(4326008)(53416004)(26005)(14444005)(70206006)(70586007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1169; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3073938e-f922-4f59-106d-08d73ca5bea8
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600167)(711020)(4605104)(1401327)(4618075)(2017052603328);
 SRVR:BN6PR12MB1169; 
X-MS-TrafficTypeDiagnostic: BN6PR12MB1169:
X-Microsoft-Antispam-PRVS: <BN6PR12MB116916AD8C803660A2ED6B7595890@BN6PR12MB1169.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:159;
X-Forefront-PRVS: 016572D96D
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: /FD+nTjH19Udzt2HVbmS8fd08Amo3pMM6qf3YO2ztFLBEU0B9Z0ernH48oPikF1MoTA0GZg2kk/KFR7WXSX+B0oEmMhA6S2D3C0A5LBBfmgnccCtemBjgMvwmjJwuwsrHKjpisMRlPd2z9fmt5GEOAgGhX7I+9eOGRDJCucSLJ13kCu9qi7ttho50tWUaBOZxES86VsXxLYKVivGGHkSnXSzwOB7BCZOLJgQ5yHtVXsH4XZv0pWSIbrJr4uRwa6zNG/WoWiDCckKOijMPSw5IBMYmY3R0e0ShAjukJLH99wNBS/qRDbTbO/yptSSkRI4910VdUfT0wSGeB5IRXw4RkHfOtIDqBJgctCz6016b0Huf/BQAx1HrLavl/8wU486cO8SdJjPmSimeo71YuruW451a0pcT9dNcR71Z0vOFGw=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2019 02:04:46.0608 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3073938e-f922-4f59-106d-08d73ca5bea8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1169
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m1PyfKybWyDxU7bUUtSbGrbFU0lHOIZCLB4uMhci4cY=;
 b=scuC8PtKEDF7NH151ok4B4nK6iJ8I1mvyYD5pGeqzzYI3mGz3zioLyHP0JJi4xdAUyJWajbRrQe6zOxoIe6gmNZU0GVwf2aIGmnrvUuFkVXsSKg76FKUrIlcgRg1Ie48/mu8bWfYRwW1NRp7rpCpxggozl14J2zZDQTjOhkpq3M=
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Tianci Yin <tianci.yin@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogIlRpYW5jaS5ZaW4iIDx0aWFuY2kueWluQGFtZC5jb20+Cgpsb2FkIGRpZmZlcmVudCBj
cCBmaXJtd2FyZSBhY2NvcmRpbmcgdG8gdGhlIERJRCBhbmQgUklECgpTaWduZWQtb2ZmLWJ5OiBU
aWFuY2kuWWluIDx0aWFuY2kueWluQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvZ2Z4X3YxMF8wLmMgfCAyNCArKysrKysrKysrKysrKysrKystLS0tLS0KIDEgZmlsZSBj
aGFuZ2VkLCAxOCBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92MTBfMC5jIGIvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvZ2Z4X3YxMF8wLmMKaW5kZXggMDgyYTBiMzI5OGE5Li5iNWQzZTc1ZTdlODggMTAw
NjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92MTBfMC5jCisrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92MTBfMC5jCkBAIC02Niw2ICs2NiwxMSBAQCBN
T0RVTEVfRklSTVdBUkUoImFtZGdwdS9uYXZpMTBfbWVjLmJpbiIpOwogTU9EVUxFX0ZJUk1XQVJF
KCJhbWRncHUvbmF2aTEwX21lYzIuYmluIik7CiBNT0RVTEVfRklSTVdBUkUoImFtZGdwdS9uYXZp
MTBfcmxjLmJpbiIpOwogCitNT0RVTEVfRklSTVdBUkUoImFtZGdwdS9uYXZpMTRfY2Vfd2tzLmJp
biIpOworTU9EVUxFX0ZJUk1XQVJFKCJhbWRncHUvbmF2aTE0X3BmcF93a3MuYmluIik7CitNT0RV
TEVfRklSTVdBUkUoImFtZGdwdS9uYXZpMTRfbWVfd2tzLmJpbiIpOworTU9EVUxFX0ZJUk1XQVJF
KCJhbWRncHUvbmF2aTE0X21lY193a3MuYmluIik7CitNT0RVTEVfRklSTVdBUkUoImFtZGdwdS9u
YXZpMTRfbWVjMl93a3MuYmluIik7CiBNT0RVTEVfRklSTVdBUkUoImFtZGdwdS9uYXZpMTRfY2Uu
YmluIik7CiBNT0RVTEVfRklSTVdBUkUoImFtZGdwdS9uYXZpMTRfcGZwLmJpbiIpOwogTU9EVUxF
X0ZJUk1XQVJFKCJhbWRncHUvbmF2aTE0X21lLmJpbiIpOwpAQCAtNTkxLDcgKzU5Niw4IEBAIHN0
YXRpYyB2b2lkIGdmeF92MTBfMF9jaGVja19nZnhvZmZfZmxhZyhzdHJ1Y3QgYW1kZ3B1X2Rldmlj
ZSAqYWRldikKIHN0YXRpYyBpbnQgZ2Z4X3YxMF8wX2luaXRfbWljcm9jb2RlKHN0cnVjdCBhbWRn
cHVfZGV2aWNlICphZGV2KQogewogCWNvbnN0IGNoYXIgKmNoaXBfbmFtZTsKLQljaGFyIGZ3X25h
bWVbMzBdOworCWNvbnN0IGNoYXIgKndrczsKKwljaGFyIGZ3X25hbWVbNDBdOwogCWludCBlcnI7
CiAJc3RydWN0IGFtZGdwdV9maXJtd2FyZV9pbmZvICppbmZvID0gTlVMTDsKIAljb25zdCBzdHJ1
Y3QgY29tbW9uX2Zpcm13YXJlX2hlYWRlciAqaGVhZGVyID0gTlVMTDsKQEAgLTYxOCw3ICs2MjQs
MTMgQEAgc3RhdGljIGludCBnZnhfdjEwXzBfaW5pdF9taWNyb2NvZGUoc3RydWN0IGFtZGdwdV9k
ZXZpY2UgKmFkZXYpCiAJCUJVRygpOwogCX0KIAotCXNucHJpbnRmKGZ3X25hbWUsIHNpemVvZihm
d19uYW1lKSwgImFtZGdwdS8lc19wZnAuYmluIiwgY2hpcF9uYW1lKTsKKwlpZihhZGV2LT5wZGV2
LT5kZXZpY2UgPT0gMHg3MzQwICYmCisJICAgYWRldi0+cGRldi0+cmV2aXNpb24gIT0gMHgwMCkK
KwkJd2tzID0gIiI7CisJZWxzZQorCQl3a3MgPSAiX3drcyI7CisKKwlzbnByaW50Zihmd19uYW1l
LCBzaXplb2YoZndfbmFtZSksICJhbWRncHUvJXNfcGZwJXMuYmluIiwgY2hpcF9uYW1lLCB3a3Mp
OwogCWVyciA9IHJlcXVlc3RfZmlybXdhcmUoJmFkZXYtPmdmeC5wZnBfZncsIGZ3X25hbWUsIGFk
ZXYtPmRldik7CiAJaWYgKGVycikKIAkJZ290byBvdXQ7CkBAIC02MjksNyArNjQxLDcgQEAgc3Rh
dGljIGludCBnZnhfdjEwXzBfaW5pdF9taWNyb2NvZGUoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFk
ZXYpCiAJYWRldi0+Z2Z4LnBmcF9md192ZXJzaW9uID0gbGUzMl90b19jcHUoY3BfaGRyLT5oZWFk
ZXIudWNvZGVfdmVyc2lvbik7CiAJYWRldi0+Z2Z4LnBmcF9mZWF0dXJlX3ZlcnNpb24gPSBsZTMy
X3RvX2NwdShjcF9oZHItPnVjb2RlX2ZlYXR1cmVfdmVyc2lvbik7CiAKLQlzbnByaW50Zihmd19u
YW1lLCBzaXplb2YoZndfbmFtZSksICJhbWRncHUvJXNfbWUuYmluIiwgY2hpcF9uYW1lKTsKKwlz
bnByaW50Zihmd19uYW1lLCBzaXplb2YoZndfbmFtZSksICJhbWRncHUvJXNfbWUlcy5iaW4iLCBj
aGlwX25hbWUsIHdrcyk7CiAJZXJyID0gcmVxdWVzdF9maXJtd2FyZSgmYWRldi0+Z2Z4Lm1lX2Z3
LCBmd19uYW1lLCBhZGV2LT5kZXYpOwogCWlmIChlcnIpCiAJCWdvdG8gb3V0OwpAQCAtNjQwLDcg
KzY1Miw3IEBAIHN0YXRpYyBpbnQgZ2Z4X3YxMF8wX2luaXRfbWljcm9jb2RlKHN0cnVjdCBhbWRn
cHVfZGV2aWNlICphZGV2KQogCWFkZXYtPmdmeC5tZV9md192ZXJzaW9uID0gbGUzMl90b19jcHUo
Y3BfaGRyLT5oZWFkZXIudWNvZGVfdmVyc2lvbik7CiAJYWRldi0+Z2Z4Lm1lX2ZlYXR1cmVfdmVy
c2lvbiA9IGxlMzJfdG9fY3B1KGNwX2hkci0+dWNvZGVfZmVhdHVyZV92ZXJzaW9uKTsKIAotCXNu
cHJpbnRmKGZ3X25hbWUsIHNpemVvZihmd19uYW1lKSwgImFtZGdwdS8lc19jZS5iaW4iLCBjaGlw
X25hbWUpOworCXNucHJpbnRmKGZ3X25hbWUsIHNpemVvZihmd19uYW1lKSwgImFtZGdwdS8lc19j
ZSVzLmJpbiIsIGNoaXBfbmFtZSwgd2tzKTsKIAllcnIgPSByZXF1ZXN0X2Zpcm13YXJlKCZhZGV2
LT5nZnguY2VfZncsIGZ3X25hbWUsIGFkZXYtPmRldik7CiAJaWYgKGVycikKIAkJZ290byBvdXQ7
CkBAIC03MDUsNyArNzE3LDcgQEAgc3RhdGljIGludCBnZnhfdjEwXzBfaW5pdF9taWNyb2NvZGUo
c3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpCiAJaWYgKGFkZXYtPmdmeC5ybGMuaXNfcmxjX3Yy
XzEpCiAJCWdmeF92MTBfMF9pbml0X3JsY19leHRfbWljcm9jb2RlKGFkZXYpOwogCi0Jc25wcmlu
dGYoZndfbmFtZSwgc2l6ZW9mKGZ3X25hbWUpLCAiYW1kZ3B1LyVzX21lYy5iaW4iLCBjaGlwX25h
bWUpOworCXNucHJpbnRmKGZ3X25hbWUsIHNpemVvZihmd19uYW1lKSwgImFtZGdwdS8lc19tZWMl
cy5iaW4iLCBjaGlwX25hbWUsIHdrcyk7CiAJZXJyID0gcmVxdWVzdF9maXJtd2FyZSgmYWRldi0+
Z2Z4Lm1lY19mdywgZndfbmFtZSwgYWRldi0+ZGV2KTsKIAlpZiAoZXJyKQogCQlnb3RvIG91dDsK
QEAgLTcxNiw3ICs3MjgsNyBAQCBzdGF0aWMgaW50IGdmeF92MTBfMF9pbml0X21pY3JvY29kZShz
dHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikKIAlhZGV2LT5nZngubWVjX2Z3X3ZlcnNpb24gPSBs
ZTMyX3RvX2NwdShjcF9oZHItPmhlYWRlci51Y29kZV92ZXJzaW9uKTsKIAlhZGV2LT5nZngubWVj
X2ZlYXR1cmVfdmVyc2lvbiA9IGxlMzJfdG9fY3B1KGNwX2hkci0+dWNvZGVfZmVhdHVyZV92ZXJz
aW9uKTsKIAotCXNucHJpbnRmKGZ3X25hbWUsIHNpemVvZihmd19uYW1lKSwgImFtZGdwdS8lc19t
ZWMyLmJpbiIsIGNoaXBfbmFtZSk7CisJc25wcmludGYoZndfbmFtZSwgc2l6ZW9mKGZ3X25hbWUp
LCAiYW1kZ3B1LyVzX21lYzIlcy5iaW4iLCBjaGlwX25hbWUsIHdrcyk7CiAJZXJyID0gcmVxdWVz
dF9maXJtd2FyZSgmYWRldi0+Z2Z4Lm1lYzJfZncsIGZ3X25hbWUsIGFkZXYtPmRldik7CiAJaWYg
KCFlcnIpIHsKIAkJZXJyID0gYW1kZ3B1X3Vjb2RlX3ZhbGlkYXRlKGFkZXYtPmdmeC5tZWMyX2Z3
KTsKLS0gCjIuMTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
