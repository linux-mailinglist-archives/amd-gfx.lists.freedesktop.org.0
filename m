Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F27BB88512
	for <lists+amd-gfx@lfdr.de>; Fri,  9 Aug 2019 23:39:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C7806EED0;
	Fri,  9 Aug 2019 21:38:59 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr810072.outbound.protection.outlook.com [40.107.81.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1883E6EECB
 for <amd-gfx@lists.freedesktop.org>; Fri,  9 Aug 2019 21:38:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OeOjSS9SpU213U/8ZCGUGZAuNo8ddhorH94SVN95d9xq0h6OIdp4cSfZYzKgWQ6/JE3M4H2NNmo+YiinI7bTV+ArusGs3eAAwJGlGNSPmchcWJys/ds2bmB+GKN8iYagq5CzHov3Cbme8sPbnlg0+5StQ6qq00Thukng9xQjXGGJ2iKT+h1kpjj7VIBdvPigwEHVhICekabgXIMluDBDrpRw3Cancc0u1ZunAnvp1Ps/bTZ30AN2DEV//9d3ge85pR0yaQZsTBgPsBJIYk4HGYjO27svjO+Sqpv2Du7ANexBXuhHkWD6JuoiXN3X3GEYSxbXJlrCkzm7mawgmJYA7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0LNtO67EnL9jl9xb8fX7nwIt7h0v06/5xJzq1AK+F+Y=;
 b=Y7+bQBd2xtnPXa86tHE4lt7uuP02iyqfIoOK5vXJJ3pW6JQNI9gfgy3Qm1vZCsMocFSW5CZVbulf5gYDJkQuWhHvZVF7pitbn0FY/Lts302tg7WP5RQ5Vm1nr1DWMGHik+QswDVSH/hxQAVc5/BTZi6k3Ehu+qWyOEI+6Qw4UJtMNs92spNkPju03jdt2Fxpb9eU/zD1vUjGUAuGq80/rgHrqqbkQJHtireeRs09NbyN2T+XYFzw2tkZybO0PNaZ9/CU1Tu9wfY7Iqk7UXTyR/vO4VmIBioR931CRLY766KoMFYF6jhAxX2dln+bFCAa7b94lat36vOcq/ETo333ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from BN6PR1201CA0023.namprd12.prod.outlook.com
 (2603:10b6:405:4c::33) by BN6PR12MB1524.namprd12.prod.outlook.com
 (2603:10b6:405:4::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2157.15; Fri, 9 Aug
 2019 21:38:56 +0000
Received: from DM3NAM03FT003.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::209) by BN6PR1201CA0023.outlook.office365.com
 (2603:10b6:405:4c::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2157.14 via Frontend
 Transport; Fri, 9 Aug 2019 21:38:56 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 DM3NAM03FT003.mail.protection.outlook.com (10.152.82.87) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2157.15 via Frontend Transport; Fri, 9 Aug 2019 21:38:56 +0000
Received: from localhost.localdomain (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1;
 Fri, 9 Aug 2019 16:38:45 -0500
From: <sunpeng.li@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 46/49] drm/amd/display: check hpd before retry verify link cap
Date: Fri, 9 Aug 2019 17:37:39 -0400
Message-ID: <20190809213742.30301-47-sunpeng.li@amd.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190809213742.30301-1-sunpeng.li@amd.com>
References: <20190809213742.30301-1-sunpeng.li@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(376002)(136003)(39860400002)(396003)(2980300002)(428003)(189003)(199004)(305945005)(8676002)(446003)(11346002)(53936002)(15650500001)(2351001)(48376002)(2876002)(6666004)(1076003)(356004)(76176011)(2870700001)(50466002)(81156014)(81166006)(2906002)(6916009)(49486002)(86362001)(51416003)(14444005)(478600001)(70586007)(2616005)(476003)(8936002)(126002)(336012)(316002)(54906003)(47776003)(486006)(26005)(186003)(50226002)(5660300002)(4326008)(36756003)(70206006)(426003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1524; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1e4a6a8f-61ff-46c4-d541-08d71d11fb5e
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:BN6PR12MB1524; 
X-MS-TrafficTypeDiagnostic: BN6PR12MB1524:
X-Microsoft-Antispam-PRVS: <BN6PR12MB1524D24D5F8A3C65D1CF7EB382D60@BN6PR12MB1524.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;
X-Forefront-PRVS: 01244308DF
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: wWK4RoLgi7q4OZCWyyjfZr4PEGIsEd0uHuhLy25iGn3s/wTvwaigwc4NmXxyA+19EsJz3vClyNAsoHqsQao63HxiNFBY8zra/oCN5FeH4/aRdLeKzmeOFulpxoeoCnPS8dwl5itWhLjmqxSaeMuv3LZdpzHvHEN9GvWhezW/aqg0AtQkQIe5SpKJl5z5y2piziC1Au+SpCoBUKSrtacdUdSKPtwISnfQ64xjva68UU7OHAEtFAbjj3gaovYfXbgeKjRFiWQocCPKKlYVIKJedwG0Wm4e7JLS7qsH4DlXCxGfulE9TMxSzfNG2tmTAMjCe1ZMvxx+aapmdGP1n7IOGc1Wi2pEm7Iu5GhA9UZxwPacOhvjbyydMZJt83mAYnwuMdt11eJ2h3hvf+J2v4SDicgGnnamhZ0Nj0cBhk6mX+8=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2019 21:38:56.4179 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e4a6a8f-61ff-46c4-d541-08d71d11fb5e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1524
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0LNtO67EnL9jl9xb8fX7nwIt7h0v06/5xJzq1AK+F+Y=;
 b=fDPvIVUc0ucr8uFKJoTCHb5tSTlJdWhWFncqn2+vv4gEDJyC3mJ0w6v/ppkoqFHxOS33tBvU/CS8Lcg7PZ19WZwTjj9Ch6ej1LLUlcgatJuvbe9/2J9TXLp/jhnZ93s8kjcjbGEYnQkd8y6whqIqCFSfIzhcqOocsoFKxuT0P+0=
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
Cc: Leo Li <sunpeng.li@amd.com>, Abdoulaye
 Berthe <Abdoulaye.Berthe@amd.com>, Jun Lei <Jun.Lei@amd.com>,
 Wenjing Liu <Wenjing.Liu@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogV2VuamluZyBMaXUgPFdlbmppbmcuTGl1QGFtZC5jb20+Cgpbd2h5XQpEdXJpbmcgZGV0
ZWN0aW9uIGxpbmsgdHJhaW5pbmcgaWYgYSBkaXNwbGF5IGlzIGRpc2Nvbm5lY3RlZCwKdGhlIGN1
cnJlbnQgY29kZSB3aWxsIHJldHJ5IDMgdGltZXMgb2YgbGluayB0cmFpbmluZwpvbiBkaXNjb25u
ZWN0ZWQgbGluayBiZWZvcmUgZ2l2aW5nIHVwLgoKW2hvd10KQmVmb3JlIGVhY2ggcmV0cnkgY2hl
Y2sgZm9yIEhQRCBzdGF0dXMsIG9ubHkgcmV0cnkKdmVyaWZ5IGxpbmsgY2FwIHdoZW4gSFBEIGlz
IHN0aWxsIGhpZ2guCkFsc28gcHV0IGEgMTBtcyBkZWxheSBiZXR3ZWVuIGVhY2ggcmV0cnkgdG8g
aW1wcm92ZQp0aGUgY2hhbmNlIG9mIHN1Y2Nlc3MuCgpTaWduZWQtb2ZmLWJ5OiBXZW5qaW5nIExp
dSA8V2VuamluZy5MaXVAYW1kLmNvbT4KUmV2aWV3ZWQtYnk6IEp1biBMZWkgPEp1bi5MZWlAYW1k
LmNvbT4KQWNrZWQtYnk6IEFiZG91bGF5ZSBCZXJ0aGUgPEFiZG91bGF5ZS5CZXJ0aGVAYW1kLmNv
bT4KQWNrZWQtYnk6IExlbyBMaSA8c3VucGVuZy5saUBhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1
L2RybS9hbWQvZGlzcGxheS9kYy9jb3JlL2RjX2xpbmsuYyB8IDI3ICsrKysrLS0tLS0tLS0tLS0t
LS0KIC4uLi9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2NvcmUvZGNfbGlua19kcC5jICB8IDI3ICsr
KysrKysrKysrKysrKysrKysKIC4uLi9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2luYy9kY19saW5r
X2RwLmggICB8ICA1ICsrKysKIDMgZmlsZXMgY2hhbmdlZCwgMzggaW5zZXJ0aW9ucygrKSwgMjEg
ZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2Rj
L2NvcmUvZGNfbGluay5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2NvcmUvZGNf
bGluay5jCmluZGV4IDFhMzAwNjZhYzYwNS4uNzhjNGQwNzI1M2JiIDEwMDY0NAotLS0gYS9kcml2
ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY29yZS9kY19saW5rLmMKKysrIGIvZHJpdmVycy9n
cHUvZHJtL2FtZC9kaXNwbGF5L2RjL2NvcmUvZGNfbGluay5jCkBAIC04NTIsMTYgKzg1Miw5IEBA
IGJvb2wgZGNfbGlua19kZXRlY3Qoc3RydWN0IGRjX2xpbmsgKmxpbmssIGVudW0gZGNfZGV0ZWN0
X3JlYXNvbiByZWFzb24pCiAJCQkJCWRjX3NpbmtfcmVsZWFzZShwcmV2X3NpbmspOwogCQkJCX0g
ZWxzZSB7CiAJCQkJCS8qIEVtcHR5IGRvbmdsZSBwbHVnIGluICovCi0JCQkJCWZvciAoaSA9IDA7
IGkgPCBMSU5LX1RSQUlOSU5HX01BWF9WRVJJRllfUkVUUlk7IGkrKykgewotCQkJCQkJaW50IGZh
aWxfY291bnQgPSAwOwotCi0JCQkJCQlkcF92ZXJpZnlfbGlua19jYXAobGluaywKLQkJCQkJCQkJ
ICAmbGluay0+cmVwb3J0ZWRfbGlua19jYXAsCi0JCQkJCQkJCSAgJmZhaWxfY291bnQpOwotCi0J
CQkJCQlpZiAoZmFpbF9jb3VudCA9PSAwKQotCQkJCQkJCWJyZWFrOwotCQkJCQl9CisJCQkJCWRw
X3ZlcmlmeV9saW5rX2NhcF93aXRoX3JldHJpZXMobGluaywKKwkJCQkJCQkmbGluay0+cmVwb3J0
ZWRfbGlua19jYXAsCisJCQkJCQkJTElOS19UUkFJTklOR19NQVhfVkVSSUZZX1JFVFJZKTsKIAkJ
CQl9CiAJCQkJcmV0dXJuIHRydWU7CiAJCQl9CkBAIC05NjUsMTcgKzk1OCw5IEBAIGJvb2wgZGNf
bGlua19kZXRlY3Qoc3RydWN0IGRjX2xpbmsgKmxpbmssIGVudW0gZGNfZGV0ZWN0X3JlYXNvbiBy
ZWFzb24pCiAJCQkgKi8KIAogCQkJLyogZGVhbCB3aXRoIG5vbi1tc3QgY2FzZXMgKi8KLQkJCWZv
ciAoaSA9IDA7IGkgPCBMSU5LX1RSQUlOSU5HX01BWF9WRVJJRllfUkVUUlk7IGkrKykgewotCQkJ
CWludCBmYWlsX2NvdW50ID0gMDsKLQotCQkJCWRwX3ZlcmlmeV9saW5rX2NhcChsaW5rLAotCQkJ
CQkJICAmbGluay0+cmVwb3J0ZWRfbGlua19jYXAsCi0JCQkJCQkgICZmYWlsX2NvdW50KTsKLQot
CQkJCWlmIChmYWlsX2NvdW50ID09IDApCi0JCQkJCWJyZWFrOwotCQkJfQotCisJCQlkcF92ZXJp
ZnlfbGlua19jYXBfd2l0aF9yZXRyaWVzKGxpbmssCisJCQkJCSZsaW5rLT5yZXBvcnRlZF9saW5r
X2NhcCwKKwkJCQkJTElOS19UUkFJTklOR19NQVhfVkVSSUZZX1JFVFJZKTsKIAkJfSBlbHNlIHsK
IAkJCS8vIElmIGVkaWQgaXMgdGhlIHNhbWUsIHRoZW4gZGlzY2FyZCBuZXcgc2luayBhbmQgcmV2
ZXJ0IGJhY2sgdG8gb3JpZ2luYWwgc2luawogCQkJaWYgKHNhbWVfZWRpZCkgewpkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2NvcmUvZGNfbGlua19kcC5jIGIvZHJp
dmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2NvcmUvZGNfbGlua19kcC5jCmluZGV4IDhlNjZi
MmU5ZDZhZi4uMmU4Nzk0MmIzZTljIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rp
c3BsYXkvZGMvY29yZS9kY19saW5rX2RwLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNw
bGF5L2RjL2NvcmUvZGNfbGlua19kcC5jCkBAIC0xNjQzLDYgKzE2NDMsMzMgQEAgYm9vbCBkcF92
ZXJpZnlfbGlua19jYXAoCiAJcmV0dXJuIHN1Y2Nlc3M7CiB9CiAKK2Jvb2wgZHBfdmVyaWZ5X2xp
bmtfY2FwX3dpdGhfcmV0cmllcygKKwlzdHJ1Y3QgZGNfbGluayAqbGluaywKKwlzdHJ1Y3QgZGNf
bGlua19zZXR0aW5ncyAqa25vd25fbGltaXRfbGlua19zZXR0aW5nLAorCWludCBhdHRlbXB0cykK
K3sKKwl1aW50OF90IGkgPSAwOworCWJvb2wgc3VjY2VzcyA9IGZhbHNlOworCisJZm9yIChpID0g
MDsgaSA8IGF0dGVtcHRzOyBpKyspIHsKKwkJaW50IGZhaWxfY291bnQgPSAwOworCQllbnVtIGRj
X2Nvbm5lY3Rpb25fdHlwZSB0eXBlOworCisJCW1lbXNldCgmbGluay0+dmVyaWZpZWRfbGlua19j
YXAsIDAsCisJCQkJc2l6ZW9mKHN0cnVjdCBkY19saW5rX3NldHRpbmdzKSk7CisJCWlmICghZGNf
bGlua19kZXRlY3Rfc2luayhsaW5rLCAmdHlwZSkpIHsKKwkJCWJyZWFrOworCQl9IGVsc2UgaWYg
KGRwX3ZlcmlmeV9saW5rX2NhcChsaW5rLAorCQkJCSZsaW5rLT5yZXBvcnRlZF9saW5rX2NhcCwK
KwkJCQkmZmFpbF9jb3VudCkgJiYgZmFpbF9jb3VudCA9PSAwKSB7CisJCQlzdWNjZXNzID0gdHJ1
ZTsKKwkJCWJyZWFrOworCQl9CisJCW1zbGVlcCgxMCk7CisJfQorCXJldHVybiBzdWNjZXNzOwor
fQorCiBzdGF0aWMgc3RydWN0IGRjX2xpbmtfc2V0dGluZ3MgZ2V0X2NvbW1vbl9zdXBwb3J0ZWRf
bGlua19zZXR0aW5ncygKIAkJc3RydWN0IGRjX2xpbmtfc2V0dGluZ3MgbGlua19zZXR0aW5nX2Es
CiAJCXN0cnVjdCBkY19saW5rX3NldHRpbmdzIGxpbmtfc2V0dGluZ19iKQpkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2luYy9kY19saW5rX2RwLmggYi9kcml2ZXJz
L2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvaW5jL2RjX2xpbmtfZHAuaAppbmRleCBiNGU3YjBjNTZm
ODMuLjA4YTRkZjJjNjFhOCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5
L2RjL2luYy9kY19saW5rX2RwLmgKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2Rj
L2luYy9kY19saW5rX2RwLmgKQEAgLTM4LDYgKzM4LDExIEBAIGJvb2wgZHBfdmVyaWZ5X2xpbmtf
Y2FwKAogCXN0cnVjdCBkY19saW5rX3NldHRpbmdzICprbm93bl9saW1pdF9saW5rX3NldHRpbmcs
CiAJaW50ICpmYWlsX2NvdW50KTsKIAorYm9vbCBkcF92ZXJpZnlfbGlua19jYXBfd2l0aF9yZXRy
aWVzKAorCXN0cnVjdCBkY19saW5rICpsaW5rLAorCXN0cnVjdCBkY19saW5rX3NldHRpbmdzICpr
bm93bl9saW1pdF9saW5rX3NldHRpbmcsCisJaW50IGF0dGVtcHRzKTsKKwogYm9vbCBkcF92YWxp
ZGF0ZV9tb2RlX3RpbWluZygKIAlzdHJ1Y3QgZGNfbGluayAqbGluaywKIAljb25zdCBzdHJ1Y3Qg
ZGNfY3J0Y190aW1pbmcgKnRpbWluZyk7Ci0tIAoyLjIyLjAKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vYW1kLWdmeA==
