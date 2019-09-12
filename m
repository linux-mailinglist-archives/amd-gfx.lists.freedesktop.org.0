Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A6005B078C
	for <lists+amd-gfx@lfdr.de>; Thu, 12 Sep 2019 06:14:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F1706EBF0;
	Thu, 12 Sep 2019 04:12:35 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680052.outbound.protection.outlook.com [40.107.68.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 096266E029
 for <amd-gfx@lists.freedesktop.org>; Thu, 12 Sep 2019 01:59:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KDwysQtGQH/gD1VCeNr5+iJNNBQLbbWx+R9RvFL1fg5IxoC0fXjZCwpHCXXf5iDXxALjGwBuTzQ1qrWGQBE5MQLIMVFgBNzTDZCCuTizNaJWMhD4zGkS15t+HDjmdyfqhgcpqpy8psyYwL/EtjZNambvtYnEssl+esvRZIIt9EXnLB/COsIse2oXCp/TRbehVfic89C5j0JWxS4T+ZuKLFbu8YOlljm3z3k5tAVmh+uBwnmXB/k3gkIU3kKh13wgUn6zW+DbRi8i7O+Yxrx9MsI/ze2xL2UVKUGXeQqUt++eXvbDxJ09lSKMYo2Cqq2bNWUZbaHl8tBSIjGNg0cIOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lr+WYBtTBmJeoi+nFFyWBerj5V/t0xEq7duv1ASwxCY=;
 b=mCChEScvyJGy0HydgrinlkohcBeyvM4oeBvX5uusY8SmDj2QTeJCoBX2ZITqXat+8bg+JS6tqhfVgtenGB9jyaWqgDocunfOBLpV05l0JKwhqrGmyg8Ki8NpeiiHD/X/xWkGboj9Rzs1MjvS5UZtfq+ovJ0UYSKOnMGckVZdGW8zvul+HyZyxtK/TRvY0PfmitxidCB9jJNF0lxukKKS3sb4IiFTz6GJEOYPWYjJXIolEXCbbTNqBskb3A972oE7R0YKCTbizZJSf2QULe6pZOvNk58rVYOimUmhpd32q+L8PpwBgyoLsaaoeZ4jP9uHcqRpWEYru0bKCx64Bt1FRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3536.namprd12.prod.outlook.com (20.179.83.19) by
 MN2PR12MB4079.namprd12.prod.outlook.com (52.135.49.17) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2241.17; Thu, 12 Sep 2019 01:59:13 +0000
Received: from MN2PR12MB3536.namprd12.prod.outlook.com
 ([fe80::ec87:49b5:712e:7d41]) by MN2PR12MB3536.namprd12.prod.outlook.com
 ([fe80::ec87:49b5:712e:7d41%7]) with mapi id 15.20.2241.018; Thu, 12 Sep 2019
 01:59:13 +0000
From: "Liang, Prike" <Prike.Liang@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amd/amdgpu: power up sdma_v4 for resume back period
Thread-Topic: [PATCH] drm/amd/amdgpu: power up sdma_v4 for resume back period
Thread-Index: AQHVaQ2tEwQt0N37/UeTBpEL38+E2A==
Date: Thu, 12 Sep 2019 01:59:13 +0000
Message-ID: <1568253538-27220-1-git-send-email-Prike.Liang@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HK2PR04CA0086.apcprd04.prod.outlook.com
 (2603:1096:202:15::30) To MN2PR12MB3536.namprd12.prod.outlook.com
 (2603:10b6:208:104::19)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.7.4
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5449e851-9b57-423f-716b-08d73724cf6d
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB4079; 
x-ms-traffictypediagnostic: MN2PR12MB4079:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB407909C73496A10DF92D281BFBB00@MN2PR12MB4079.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:913;
x-forefront-prvs: 01583E185C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(39860400002)(376002)(366004)(396003)(136003)(189003)(199004)(25786009)(54906003)(7736002)(50226002)(8676002)(102836004)(3846002)(4326008)(5660300002)(6116002)(6512007)(81156014)(2351001)(81166006)(6436002)(5640700003)(256004)(53936002)(386003)(6506007)(2501003)(36756003)(186003)(2906002)(52116002)(99286004)(14454004)(6486002)(478600001)(8936002)(26005)(71190400001)(71200400001)(66066001)(86362001)(316002)(2616005)(6916009)(305945005)(64756008)(66556008)(66446008)(66476007)(476003)(66946007)(486006);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB4079;
 H:MN2PR12MB3536.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 6fx1sPGBvZLGE/DmfeRADw98dExuJpEyKp/GjRJ3xSO1eU27+UfV0h6iVlqG6+jjpK3icMq/VvgldzZFERVnagx3o0xMkgsTCYonHq0SrNuV4FjdtRJS3q1gMmstazeaWuBaA7db0YJqQ4thGMVXsCSUSkhTdPQS6Uu82j7RgUw0ohS1oZdWWe4dipTngPODpVNZ05GXYVxQ72UMFga+BK24T+Kwy/sLpEGToRvzeEVZ9N1QXyi310YF/R0NyYcBRWXo37pr9ZAeOZW1Tg0v7YRv3vUJx0UItrX4FHPl2gMEF7mxwpIO5O++KWoUmCbxvuqktPL+9eT2jepAvFiPxoVS8WyCwqtrP2ALxDN+heLSsBpKs1p8h+s77wKyxlzGUOlvrXAeW8Z/gKFdwyrsY6KGlPSBOB8B4z4EP18v5a0=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5449e851-9b57-423f-716b-08d73724cf6d
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Sep 2019 01:59:13.6599 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nl6zUif3A+4QFj34VdZjKUPS+BNNc8h2rH28REOnr4PxR3kQsSkTV0CLmnqToVsQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4079
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lr+WYBtTBmJeoi+nFFyWBerj5V/t0xEq7duv1ASwxCY=;
 b=JA/mAy8eU9WC7qGRVYguhUKEpFi3gNfmbjpD0UJfP1mY+tJiqGv+N1PLMaA3IerhB9PKw0D7eRg2PrShE1x+dLmnv/8WiJflAusZrr3X/wcv4qCiAiO6j4DCtrH/sOqvgJno9D2F8OHVg23uy8wW5HkQbk1PgdwM4/5rdt5sRPQ=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Prike.Liang@amd.com; 
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
Cc: "Huang, Ray" <Ray.Huang@amd.com>, "Liang,
 Prike" <Prike.Liang@amd.com>, "Quan, Evan" <Evan.Quan@amd.com>, "Feng,
 Kenneth" <Kenneth.Feng@amd.com>, "Liu, Aaron" <Aaron.Liu@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

VGhlIHNkbWFfdjQgc2hvdWxkIGJlIHVuZ2F0ZWQgd2hlbiB0aGUgSVAgcmVzdW1lIGJhY2ssCm90
aGVyd2lzZSBpdCB3aWxsIGhhbmcgdXAgYW5kIHJlc3VtZSB0aW1lIG91dCBlcnJvci4KClNpZ25l
ZC1vZmYtYnk6IFByaWtlIExpYW5nIDxQcmlrZS5MaWFuZ0BhbWQuY29tPgotLS0KIGRyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kcG0uYyAgICB8ICAyICstCiBkcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9zZG1hX3Y0XzAuYyAgICAgfCAxMCArKysrKystLS0tCiBkcml2ZXJzL2dw
dS9kcm0vYW1kL3Bvd2VycGxheS9hbWRncHVfc211LmMgfCAgMyArKysKIDMgZmlsZXMgY2hhbmdl
ZCwgMTAgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZHBtLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9hbWRncHVfZHBtLmMKaW5kZXggMzU3ZTQ1Zi4uMjYzMjY1MiAxMDA2NDQKLS0tIGEvZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RwbS5jCisrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L2FtZGdwdV9kcG0uYwpAQCAtOTUxLDYgKzk1MSw3IEBAIGludCBhbWRncHVf
ZHBtX3NldF9wb3dlcmdhdGluZ19ieV9zbXUoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsIHVp
bnQzMl90IGJsb2NrCiAJY2FzZSBBTURfSVBfQkxPQ0tfVFlQRV9VVkQ6CiAJY2FzZSBBTURfSVBf
QkxPQ0tfVFlQRV9WQ046CiAJY2FzZSBBTURfSVBfQkxPQ0tfVFlQRV9WQ0U6CisJY2FzZSBBTURf
SVBfQkxPQ0tfVFlQRV9TRE1BOgogCQlpZiAoc3dzbXUpCiAJCQlyZXQgPSBzbXVfZHBtX3NldF9w
b3dlcl9nYXRlKCZhZGV2LT5zbXUsIGJsb2NrX3R5cGUsIGdhdGUpOwogCQllbHNlCkBAIC05NTks
NyArOTYwLDYgQEAgaW50IGFtZGdwdV9kcG1fc2V0X3Bvd2VyZ2F0aW5nX2J5X3NtdShzdHJ1Y3Qg
YW1kZ3B1X2RldmljZSAqYWRldiwgdWludDMyX3QgYmxvY2sKIAkJYnJlYWs7CiAJY2FzZSBBTURf
SVBfQkxPQ0tfVFlQRV9HTUM6CiAJY2FzZSBBTURfSVBfQkxPQ0tfVFlQRV9BQ1A6Ci0JY2FzZSBB
TURfSVBfQkxPQ0tfVFlQRV9TRE1BOgogCQlyZXQgPSAoKGFkZXYpLT5wb3dlcnBsYXkucHBfZnVu
Y3MtPnNldF9wb3dlcmdhdGluZ19ieV9zbXUoCiAJCQkJKGFkZXYpLT5wb3dlcnBsYXkucHBfaGFu
ZGxlLCBibG9ja190eXBlLCBnYXRlKSk7CiAJCWJyZWFrOwpkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvc2RtYV92NF8wLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9zZG1hX3Y0XzAuYwppbmRleCBkMDE5Yjg1Li5iNTM2ZjA0IDEwMDY0NAotLS0gYS9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9zZG1hX3Y0XzAuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9zZG1hX3Y0XzAuYwpAQCAtMTgwMSw4ICsxODAxLDkgQEAgc3RhdGljIGludCBzZG1h
X3Y0XzBfaHdfaW5pdCh2b2lkICpoYW5kbGUpCiAJaW50IHI7CiAJc3RydWN0IGFtZGdwdV9kZXZp
Y2UgKmFkZXYgPSAoc3RydWN0IGFtZGdwdV9kZXZpY2UgKiloYW5kbGU7CiAKLQlpZiAoYWRldi0+
YXNpY190eXBlID09IENISVBfUkFWRU4gJiYgYWRldi0+cG93ZXJwbGF5LnBwX2Z1bmNzICYmCi0J
CQlhZGV2LT5wb3dlcnBsYXkucHBfZnVuY3MtPnNldF9wb3dlcmdhdGluZ19ieV9zbXUpCisJaWYg
KChhZGV2LT5hc2ljX3R5cGUgPT0gQ0hJUF9SQVZFTiAmJiBhZGV2LT5wb3dlcnBsYXkucHBfZnVu
Y3MgJiYKKwkJCWFkZXYtPnBvd2VycGxheS5wcF9mdW5jcy0+c2V0X3Bvd2VyZ2F0aW5nX2J5X3Nt
dSkgfHwKKwkJCWFkZXYtPmFzaWNfdHlwZSA9PSBDSElQX1JFTk9JUikKIAkJYW1kZ3B1X2RwbV9z
ZXRfcG93ZXJnYXRpbmdfYnlfc211KGFkZXYsIEFNRF9JUF9CTE9DS19UWVBFX1NETUEsIGZhbHNl
KTsKIAogCWlmICghYW1kZ3B1X3NyaW92X3ZmKGFkZXYpKQpAQCAtMTgyOSw4ICsxODMwLDkgQEAg
c3RhdGljIGludCBzZG1hX3Y0XzBfaHdfZmluaSh2b2lkICpoYW5kbGUpCiAJc2RtYV92NF8wX2N0
eF9zd2l0Y2hfZW5hYmxlKGFkZXYsIGZhbHNlKTsKIAlzZG1hX3Y0XzBfZW5hYmxlKGFkZXYsIGZh
bHNlKTsKIAotCWlmIChhZGV2LT5hc2ljX3R5cGUgPT0gQ0hJUF9SQVZFTiAmJiBhZGV2LT5wb3dl
cnBsYXkucHBfZnVuY3MKLQkJCSYmIGFkZXYtPnBvd2VycGxheS5wcF9mdW5jcy0+c2V0X3Bvd2Vy
Z2F0aW5nX2J5X3NtdSkKKwlpZiAoKGFkZXYtPmFzaWNfdHlwZSA9PSBDSElQX1JBVkVOICYmIGFk
ZXYtPnBvd2VycGxheS5wcF9mdW5jcworCQkJJiYgYWRldi0+cG93ZXJwbGF5LnBwX2Z1bmNzLT5z
ZXRfcG93ZXJnYXRpbmdfYnlfc211KSB8fAorCQkJYWRldi0+YXNpY190eXBlID09IENISVBfUkVO
T0lSKQogCQlhbWRncHVfZHBtX3NldF9wb3dlcmdhdGluZ19ieV9zbXUoYWRldiwgQU1EX0lQX0JM
T0NLX1RZUEVfU0RNQSwgdHJ1ZSk7CiAKIAlyZXR1cm4gMDsKZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9hbWQvcG93ZXJwbGF5L2FtZGdwdV9zbXUuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQv
cG93ZXJwbGF5L2FtZGdwdV9zbXUuYwppbmRleCBlMThiZmNlLi5hNWZjYTUxIDEwMDY0NAotLS0g
YS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9hbWRncHVfc211LmMKKysrIGIvZHJpdmVy
cy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvYW1kZ3B1X3NtdS5jCkBAIC00MDAsNiArNDAwLDkgQEAg
aW50IHNtdV9kcG1fc2V0X3Bvd2VyX2dhdGUoc3RydWN0IHNtdV9jb250ZXh0ICpzbXUsIHVpbnQz
Ml90IGJsb2NrX3R5cGUsCiAJY2FzZSBBTURfSVBfQkxPQ0tfVFlQRV9HRlg6CiAJCXJldCA9IHNt
dV9nZnhfb2ZmX2NvbnRyb2woc211LCBnYXRlKTsKIAkJYnJlYWs7CisJY2FzZSBBTURfSVBfQkxP
Q0tfVFlQRV9TRE1BOgorCQlyZXQgPSBzbXVfcG93ZXJnYXRlX3NkbWEoc211LCBnYXRlKTsKKwkJ
YnJlYWs7CiAJZGVmYXVsdDoKIAkJYnJlYWs7CiAJfQotLSAKMi43LjQKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFt
ZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
