Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3802510197
	for <lists+amd-gfx@lfdr.de>; Tue, 30 Apr 2019 23:10:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C744D89317;
	Tue, 30 Apr 2019 21:10:22 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-eopbgr760053.outbound.protection.outlook.com [40.107.76.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1CE689264
 for <amd-gfx@lists.freedesktop.org>; Tue, 30 Apr 2019 21:10:06 +0000 (UTC)
Received: from DM3PR12CA0106.namprd12.prod.outlook.com (2603:10b6:0:55::26) by
 DM5PR12MB2374.namprd12.prod.outlook.com (2603:10b6:4:b4::15) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1856.10; Tue, 30 Apr 2019 21:10:03 +0000
Received: from BY2NAM03FT009.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::200) by DM3PR12CA0106.outlook.office365.com
 (2603:10b6:0:55::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1856.10 via Frontend
 Transport; Tue, 30 Apr 2019 21:10:03 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 BY2NAM03FT009.mail.protection.outlook.com (10.152.84.120) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.1835.14 via Frontend Transport; Tue, 30 Apr 2019 21:10:03 +0000
Received: from blakha.amd.com (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1; Tue, 30 Apr 2019
 16:09:52 -0500
From: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 13/20] drm/amd/display: change name from
 dc_link_get_verified_link_cap to dc_link_get_link_cap
Date: Tue, 30 Apr 2019 17:09:23 -0400
Message-ID: <20190430210938.32335-26-Bhawanpreet.Lakha@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190430210938.32335-1-Bhawanpreet.Lakha@amd.com>
References: <20190430210938.32335-1-Bhawanpreet.Lakha@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(376002)(396003)(39860400002)(136003)(346002)(2980300002)(428003)(189003)(199004)(50226002)(77096007)(16586007)(50466002)(186003)(2351001)(48376002)(68736007)(36756003)(126002)(305945005)(53416004)(2906002)(316002)(47776003)(6916009)(486006)(476003)(11346002)(446003)(8936002)(2616005)(14444005)(4326008)(81166006)(7696005)(26005)(81156014)(51416003)(8676002)(76176011)(86362001)(336012)(53936002)(70586007)(72206003)(1076003)(426003)(478600001)(5660300002)(356004)(6666004)(70206006);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB2374; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7ba6a8d5-9dd8-4266-4de3-08d6cdb0369e
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328);
 SRVR:DM5PR12MB2374; 
X-MS-TrafficTypeDiagnostic: DM5PR12MB2374:
X-Microsoft-Antispam-PRVS: <DM5PR12MB237497485159CAE7D67D8E32F93A0@DM5PR12MB2374.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1002;
X-Forefront-PRVS: 00235A1EEF
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: S9EQTTpst4AfSyE2wd+snzq2rllxKqY5akxkOiFg7IuFvSUegJ97cBswKeXGouKLtej0WENlvN8iharL38V6tesIjMsM6IKLSmKibaJiF4CsF3Wmx2kqF3shnT8y2d8/VBS+Toglh51LUcxSgoahsG2Or/cJet8HUkO5FCW2/raGKcP2eyxYR62JKW9n+4ZfoVZ8AUuebSWQm9Tzs21obm1ud2CPKKkh/IxKK0cKGV/SEOxTmBbgQRjm3ex5FRaUxn3q0pNubE86XLyg++URb4LYbuYXCnAGzv7KuO0ethtbsY7Xhw+kY7JdaqowxfcMA26qE9xTtisJ4AKzoW9RZSjt5rptV/F3qiHXONzWNAhDP65ZU1GMCd0U0tgaIla2iPwPd8KDLi/0AI6L0QtEc3IbjCT1ogYQQA5kpGVqeFQ=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2019 21:10:03.1934 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ba6a8d5-9dd8-4266-4de3-08d6cdb0369e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB2374
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amd-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HBHilLOBFACWtjIiy5Tt7y/2Og9bDTs5MbLFOt/pfWw=;
 b=pn1XhJml7Wm7QuEG3RJs5bjwqqj2eDLEsHswtqEq9ckWES40kquwVtmSFDO07B1gNrJdeXqaWdETlPH3Q6mkiLbFodpe6ey5KF4g/Bimj+n36d59sagFukdWnvIt8ZeA8v9YnAkeJ3UpIgbaETWd6ZZUW1/EqiikAZ/F/IF+dLE=
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
Cc: Samson Tam <Samson.Tam@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogU2Ftc29uIFRhbSA8U2Ftc29uLlRhbUBhbWQuY29tPgoKW1doeV0KRE0gZG9lc24ndCBu
ZWVkIHRvIGtub3cgd2hpY2ggbGluayBjYXAgaXMgYmVpbmcgcmV0cmlldmVkICggdmVyaWZpZWQK
IG9yIHByZWZlcnJlZCApLiAgTGV0IERDIGZpZ3VyZSBpdCBvdXQuCgpbSG93XQpDaGFuZ2UgbmFt
ZS4KCkNoYW5nZS1JZDogSTU1ODVhYzdkY2RmNTgyMTZiMjk0MmY3YWI2NzU4YzVkMTU3MTlkMGQK
U2lnbmVkLW9mZi1ieTogU2Ftc29uIFRhbSA8U2Ftc29uLlRhbUBhbWQuY29tPgpSZXZpZXdlZC1i
eTogVG9ueSBDaGVuZyA8VG9ueS5DaGVuZ0BhbWQuY29tPgpBY2tlZC1ieTogQmhhd2FucHJlZXQg
TGFraGEgPEJoYXdhbnByZWV0IExha2hhQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2Ft
ZC9kaXNwbGF5L2RjL2NvcmUvZGMuYyAgICAgICAgIHwgMiArLQogZHJpdmVycy9ncHUvZHJtL2Ft
ZC9kaXNwbGF5L2RjL2NvcmUvZGNfbGlua19kcC5jIHwgMyArLS0KIGRyaXZlcnMvZ3B1L2RybS9h
bWQvZGlzcGxheS9kYy9kY19saW5rLmggICAgICAgICB8IDIgKy0KIDMgZmlsZXMgY2hhbmdlZCwg
MyBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9hbWQvZGlzcGxheS9kYy9jb3JlL2RjLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3Bs
YXkvZGMvY29yZS9kYy5jCmluZGV4IGNjMWRjYjQ4NmJiOC4uNzFhMTNlYjczM2I5IDEwMDY0NAot
LS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY29yZS9kYy5jCisrKyBiL2RyaXZl
cnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9jb3JlL2RjLmMKQEAgLTYwMyw3ICs2MDMsNyBAQCB1
aW50MzJfdCBkY19saW5rX2JhbmR3aWR0aF9rYnBzKAogCiB9CiAKLWNvbnN0IHN0cnVjdCBkY19s
aW5rX3NldHRpbmdzICpkY19saW5rX2dldF92ZXJpZmllZF9saW5rX2NhcCgKK2NvbnN0IHN0cnVj
dCBkY19saW5rX3NldHRpbmdzICpkY19saW5rX2dldF9saW5rX2NhcCgKIAkJY29uc3Qgc3RydWN0
IGRjX2xpbmsgKmxpbmspCiB7CiAJaWYgKGxpbmstPnByZWZlcnJlZF9saW5rX3NldHRpbmcubGFu
ZV9jb3VudCAhPSBMQU5FX0NPVU5UX1VOS05PV04gJiYKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9hbWQvZGlzcGxheS9kYy9jb3JlL2RjX2xpbmtfZHAuYyBiL2RyaXZlcnMvZ3B1L2RybS9h
bWQvZGlzcGxheS9kYy9jb3JlL2RjX2xpbmtfZHAuYwppbmRleCBiYTc1MDJmM2QwZWIuLmE2NDI0
YzcwZjRjNSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2NvcmUv
ZGNfbGlua19kcC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9jb3JlL2Rj
X2xpbmtfZHAuYwpAQCAtMTU0OCw4ICsxNTQ4LDcgQEAgYm9vbCBkcF92YWxpZGF0ZV9tb2RlX3Rp
bWluZygKIAkJdGltaW5nLT52X2FkZHJlc3NhYmxlID09ICh1aW50MzJfdCkgNDgwKQogCQlyZXR1
cm4gdHJ1ZTsKIAotCS8qIFdlIGFsd2F5cyB1c2UgdmVyaWZpZWQgbGluayBzZXR0aW5ncyAqLwot
CWxpbmtfc2V0dGluZyA9IGRjX2xpbmtfZ2V0X3ZlcmlmaWVkX2xpbmtfY2FwKGxpbmspOworCWxp
bmtfc2V0dGluZyA9IGRjX2xpbmtfZ2V0X2xpbmtfY2FwKGxpbmspOwogCiAJLyogVE9ETzogRFlO
QU1JQ19WQUxJREFUSU9OIG5lZWRzIHRvIGJlIGltcGxlbWVudGVkICovCiAJLyppZiAoZmxhZ3Mu
RFlOQU1JQ19WQUxJREFUSU9OID09IDEgJiYKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9h
bWQvZGlzcGxheS9kYy9kY19saW5rLmggYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMv
ZGNfbGluay5oCmluZGV4IDRlMjZkNmU5M2IzMS4uY2M3ZmZhYzY0Yzk2IDEwMDY0NAotLS0gYS9k
cml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNfbGluay5oCisrKyBiL2RyaXZlcnMvZ3B1
L2RybS9hbWQvZGlzcGxheS9kYy9kY19saW5rLmgKQEAgLTI1MCw3ICsyNTAsNyBAQCB1aW50MzJf
dCBkY19saW5rX2JhbmR3aWR0aF9rYnBzKAogCWNvbnN0IHN0cnVjdCBkY19saW5rICpsaW5rLAog
CWNvbnN0IHN0cnVjdCBkY19saW5rX3NldHRpbmdzICpsaW5rX3NldHRpbmcpOwogCi1jb25zdCBz
dHJ1Y3QgZGNfbGlua19zZXR0aW5ncyAqZGNfbGlua19nZXRfdmVyaWZpZWRfbGlua19jYXAoCitj
b25zdCBzdHJ1Y3QgZGNfbGlua19zZXR0aW5ncyAqZGNfbGlua19nZXRfbGlua19jYXAoCiAJCWNv
bnN0IHN0cnVjdCBkY19saW5rICpsaW5rKTsKIAogYm9vbCBkY19zdWJtaXRfaTJjKAotLSAKMi4x
Ny4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQt
Z2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
