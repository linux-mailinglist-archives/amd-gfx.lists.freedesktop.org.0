Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B2D17F06B
	for <lists+amd-gfx@lfdr.de>; Fri,  2 Aug 2019 11:26:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79BF56ED83;
	Fri,  2 Aug 2019 09:26:53 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr800058.outbound.protection.outlook.com [40.107.80.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD8536ED83
 for <amd-gfx@lists.freedesktop.org>; Fri,  2 Aug 2019 09:26:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wwne0gwZ6uuOzULmj5sWsI/igI7oaQzakrjfdEE5biAGsvA3svbQqpNZPVvzsDqg3w+N4npz6KV357Viv3Ki2iJw5ygGk3nAr+bosGd14ThcEO0YZNDvT3nIUlu6G0p2lKtUcPdWPYzX6lf5YAFdY3Mihrda895HcEpis1AyNE33pjpigJgiBqn9Df3MTb0y9FxwYPNRigMicHkyWH/glSQGd4Bi4ye0XVpAmN440T2DDYj9CCyaWdwqWO//JBiaSSw4/8V8v1rFmhB6aHRHuzlVow3AAVnS5j9oydPGyszVWUTrqkaVLHY4Py7H+QCs7VjC5n4RMnU2uSANZbua+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xfKuVaTG9ejkL1lmGAYBv8wb8trFke0nxmCwTGYGQkw=;
 b=SJN719ciPgxWLfhYYawVaLrgX4xuR8hQt3LHLAuU8ESeYp//x+2tITnhA4QRZNhvjRaFa7kV3VJlSYAK+gcLVQB9oMhL6lP1oCqvVjKyUXo+4F8daSlEgVaE2n0Fjdxpvt2cFQKH5Hjwj3nwSLfC24SVIZQln/b23PpVghBlvPEf+kYz6OwgGZuqQX4TpFfy9+zs7IqD5fOk1Q26KWlOwUj+dg6WiiOnEf5+A+0RFI6uJcWB5ZPvn1ruHMxXXcffpiziFXFhylun7+1p5IDe96/HMEigtkc7Y/zxrQeHeQYEWIkI/NI0lXc9kojXhMpTj89EZd+dh9UlktqasjsASA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=amd.com;dmarc=permerror action=none
 header.from=amd.com;dkim=none (message not signed);arc=none
Received: from BN6PR12CA0046.namprd12.prod.outlook.com (2603:10b6:405:70::32)
 by SN1PR12MB2541.namprd12.prod.outlook.com (2603:10b6:802:2a::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2115.15; Fri, 2 Aug
 2019 09:26:51 +0000
Received: from DM3NAM03FT033.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::202) by BN6PR12CA0046.outlook.office365.com
 (2603:10b6:405:70::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2136.14 via Frontend
 Transport; Fri, 2 Aug 2019 09:26:51 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 DM3NAM03FT033.mail.protection.outlook.com (10.152.82.204) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2136.14 via Frontend Transport; Fri, 2 Aug 2019 09:26:50 +0000
Received: from equan-buildpc.amd.com (10.34.1.3) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Fri, 2 Aug 2019
 04:26:49 -0500
From: Evan Quan <evan.quan@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amd/powerplay: correct navi10 vcn powergate
Date: Fri, 2 Aug 2019 17:26:45 +0800
Message-ID: <20190802092645.25486-1-evan.quan@amd.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(396003)(376002)(346002)(39860400002)(2980300002)(428003)(199004)(189003)(53936002)(81166006)(356004)(53416004)(336012)(86362001)(186003)(26005)(2351001)(51416003)(4326008)(2870700001)(6666004)(36756003)(2906002)(426003)(48376002)(68736007)(70586007)(476003)(8676002)(6916009)(1076003)(7696005)(5660300002)(126002)(2616005)(8936002)(478600001)(316002)(70206006)(486006)(81156014)(44832011)(50466002)(50226002)(47776003)(305945005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:SN1PR12MB2541; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: eb51d480-7a39-4a84-8ad1-08d7172b8cd3
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:SN1PR12MB2541; 
X-MS-TrafficTypeDiagnostic: SN1PR12MB2541:
X-Microsoft-Antispam-PRVS: <SN1PR12MB2541578F05B26A2CA8631DF1E4D90@SN1PR12MB2541.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1728;
X-Forefront-PRVS: 011787B9DD
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: tbQ1phA0qH0kWZpV+Sn2z/+TCAna9XUNS/G4839wWPROqTYGI1yVU1RHo9UY2cHUJ70iF9kSgAe1N+9CwwptQoMDfESnuy04v+2+T7SKOWzq3i1d9Wr+VdFf2Gr2PywqFyIcyiUFG0FrdI13zZHRO7waAXHZeoV4vUNmqqF1fub/18MDWl6rAW+UghpUDiaVkOXgQxF/qd3vEtgbX3YJPoPcmQcPkgkihkOBWlYr6rjIEoIlzvwLXi+CJOY2+EUwm7RiZYFaPtacAoAffyuAZrfwr8CVbd7iBOryL2ZkQrMb3ry56qM7ztTImQXpxUcuqJTexSkwhL7DfUsQ3xeZUE4gP1L48qj22/nxU+SP7kHPgFR5QnGj57BbSgiAtmF7kGfsMlFPgJr+7xwcUQfNF6cUyzHXMjrQ6jmImFKBEds=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2019 09:26:50.8940 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: eb51d480-7a39-4a84-8ad1-08d7172b8cd3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR12MB2541
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xfKuVaTG9ejkL1lmGAYBv8wb8trFke0nxmCwTGYGQkw=;
 b=z4lxWmanI27wvF0XTRTcy9GLuRVAY/kKYnDZdQHc/HT21SbTzkP+RqHO6KSLUDTg5fkjIHSMU1QZDpP+5JBM0oCb6v+U0c7EGh0iiOQbh1pZ8cEKFJ8dxsjftKP9M5LE9XxAJRnrQ1Fh9g1qFIkaiXTyXAwatBp/jnxuSl2HDCw=
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
Cc: Evan Quan <evan.quan@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

dmNuIGRwbSBvbiBpcyBhIHByZXJlcXVpc2l0ZSBmb3IgdmNuIHBvd2VyIGdhdGUgY29udHJvbC4K
CkNoYW5nZS1JZDogSWY4OWE4MWJjMDcwOWYxYzI2NTY5ZTM3ODUwN2E4NzNjZmFmNmUwZWYKU2ln
bmVkLW9mZi1ieTogRXZhbiBRdWFuIDxldmFuLnF1YW5AYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dw
dS9kcm0vYW1kL3Bvd2VycGxheS9hbWRncHVfc211LmMgICAgfCAgNCArKystCiAuLi4vZ3B1L2Ry
bS9hbWQvcG93ZXJwbGF5L2luYy9hbWRncHVfc211LmggICAgfCAgMSArCiBkcml2ZXJzL2dwdS9k
cm0vYW1kL3Bvd2VycGxheS9uYXZpMTBfcHB0LmMgICAgfCAyMyArKysrKysrKysrKystLS0tLS0t
CiAzIGZpbGVzIGNoYW5nZWQsIDE5IGluc2VydGlvbnMoKyksIDkgZGVsZXRpb25zKC0pCgpkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvYW1kZ3B1X3NtdS5jIGIvZHJp
dmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvYW1kZ3B1X3NtdS5jCmluZGV4IDRjODczYjk2MGFm
ZS4uMTVmOTExMzE0NmVkIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxh
eS9hbWRncHVfc211LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvYW1kZ3B1
X3NtdS5jCkBAIC00MDAsNiArNDAwLDggQEAgaW50IHNtdV9nZXRfcG93ZXJfbnVtX3N0YXRlcyhz
dHJ1Y3Qgc211X2NvbnRleHQgKnNtdSwKIGludCBzbXVfY29tbW9uX3JlYWRfc2Vuc29yKHN0cnVj
dCBzbXVfY29udGV4dCAqc211LCBlbnVtIGFtZF9wcF9zZW5zb3JzIHNlbnNvciwKIAkJCSAgIHZv
aWQgKmRhdGEsIHVpbnQzMl90ICpzaXplKQogeworCXN0cnVjdCBzbXVfcG93ZXJfY29udGV4dCAq
c211X3Bvd2VyID0gJnNtdS0+c211X3Bvd2VyOworCXN0cnVjdCBzbXVfcG93ZXJfZ2F0ZSAqcG93
ZXJfZ2F0ZSA9ICZzbXVfcG93ZXItPnBvd2VyX2dhdGU7CiAJaW50IHJldCA9IDA7CiAKIAlzd2l0
Y2ggKHNlbnNvcikgewpAQCAtNDI0LDcgKzQyNiw3IEBAIGludCBzbXVfY29tbW9uX3JlYWRfc2Vu
c29yKHN0cnVjdCBzbXVfY29udGV4dCAqc211LCBlbnVtIGFtZF9wcF9zZW5zb3JzIHNlbnNvciwK
IAkJKnNpemUgPSA0OwogCQlicmVhazsKIAljYXNlIEFNREdQVV9QUF9TRU5TT1JfVkNOX1BPV0VS
X1NUQVRFOgotCQkqKHVpbnQzMl90ICopZGF0YSA9IHNtdV9mZWF0dXJlX2lzX2VuYWJsZWQoc211
LCBTTVVfRkVBVFVSRV9WQ05fUEdfQklUKSA/IDEgOiAwOworCQkqKHVpbnQzMl90ICopZGF0YSA9
IHBvd2VyX2dhdGUtPnZjbl9nYXRlZCA/IDAgOiAxOwogCQkqc2l6ZSA9IDQ7CiAJCWJyZWFrOwog
CWRlZmF1bHQ6CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9pbmMv
YW1kZ3B1X3NtdS5oIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvaW5jL2FtZGdwdV9z
bXUuaAppbmRleCAxZWNkNzNjZDc2OGMuLjI1NzliMDAyNjE2YyAxMDA2NDQKLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvaW5jL2FtZGdwdV9zbXUuaAorKysgYi9kcml2ZXJzL2dw
dS9kcm0vYW1kL3Bvd2VycGxheS9pbmMvYW1kZ3B1X3NtdS5oCkBAIC0yNzcsNiArMjc3LDcgQEAg
c3RydWN0IHNtdV9kcG1fY29udGV4dCB7CiBzdHJ1Y3Qgc211X3Bvd2VyX2dhdGUgewogCWJvb2wg
dXZkX2dhdGVkOwogCWJvb2wgdmNlX2dhdGVkOworCWJvb2wgdmNuX2dhdGVkOwogfTsKIAogc3Ry
dWN0IHNtdV9wb3dlcl9jb250ZXh0IHsKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQv
cG93ZXJwbGF5L25hdmkxMF9wcHQuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L25h
dmkxMF9wcHQuYwppbmRleCBmM2FkYjcxMzc4NGEuLmI3YmIwZjc4ZjQ4OSAxMDA2NDQKLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvbmF2aTEwX3BwdC5jCisrKyBiL2RyaXZlcnMv
Z3B1L2RybS9hbWQvcG93ZXJwbGF5L25hdmkxMF9wcHQuYwpAQCAtNTkwLDIwICs1OTAsMjcgQEAg
c3RhdGljIGludCBuYXZpMTBfc2V0X2RlZmF1bHRfZHBtX3RhYmxlKHN0cnVjdCBzbXVfY29udGV4
dCAqc211KQogCiBzdGF0aWMgaW50IG5hdmkxMF9kcG1fc2V0X3V2ZF9lbmFibGUoc3RydWN0IHNt
dV9jb250ZXh0ICpzbXUsIGJvb2wgZW5hYmxlKQogeworCXN0cnVjdCBzbXVfcG93ZXJfY29udGV4
dCAqc211X3Bvd2VyID0gJnNtdS0+c211X3Bvd2VyOworCXN0cnVjdCBzbXVfcG93ZXJfZ2F0ZSAq
cG93ZXJfZ2F0ZSA9ICZzbXVfcG93ZXItPnBvd2VyX2dhdGU7CiAJaW50IHJldCA9IDA7CiAKIAlp
ZiAoZW5hYmxlKSB7Ci0JCXJldCA9IHNtdV9zZW5kX3NtY19tc2dfd2l0aF9wYXJhbShzbXUsIFNN
VV9NU0dfUG93ZXJVcFZjbiwgMSk7Ci0JCWlmIChyZXQpCi0JCQlyZXR1cm4gcmV0OworCQkvKiB2
Y24gZHBtIG9uIGlzIGEgcHJlcmVxdWlzaXRlIGZvciB2Y24gcG93ZXIgZ2F0ZSBtZXNzYWdlcyAq
LworCQlpZiAoc211X2ZlYXR1cmVfaXNfZW5hYmxlZChzbXUsIFNNVV9GRUFUVVJFX1ZDTl9QR19C
SVQpKSB7CisJCQlyZXQgPSBzbXVfc2VuZF9zbWNfbXNnX3dpdGhfcGFyYW0oc211LCBTTVVfTVNH
X1Bvd2VyVXBWY24sIDEpOworCQkJaWYgKHJldCkKKwkJCQlyZXR1cm4gcmV0OworCQl9CisJCXBv
d2VyX2dhdGUtPnZjbl9nYXRlZCA9IGZhbHNlOwogCX0gZWxzZSB7Ci0JCXJldCA9IHNtdV9zZW5k
X3NtY19tc2coc211LCBTTVVfTVNHX1Bvd2VyRG93blZjbik7Ci0JCWlmIChyZXQpCi0JCQlyZXR1
cm4gcmV0OworCQlpZiAoc211X2ZlYXR1cmVfaXNfZW5hYmxlZChzbXUsIFNNVV9GRUFUVVJFX1ZD
Tl9QR19CSVQpKSB7CisJCQlyZXQgPSBzbXVfc2VuZF9zbWNfbXNnKHNtdSwgU01VX01TR19Qb3dl
ckRvd25WY24pOworCQkJaWYgKHJldCkKKwkJCQlyZXR1cm4gcmV0OworCQl9CisJCXBvd2VyX2dh
dGUtPnZjbl9nYXRlZCA9IHRydWU7CiAJfQogCi0JcmV0ID0gc211X2ZlYXR1cmVfc2V0X2VuYWJs
ZWQoc211LCBTTVVfRkVBVFVSRV9WQ05fUEdfQklULCBlbmFibGUpOwotCiAJcmV0dXJuIHJldDsK
IH0KIAotLSAKMi4yMi4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
