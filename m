Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99B0F6E248
	for <lists+amd-gfx@lfdr.de>; Fri, 19 Jul 2019 10:11:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 342D16E48D;
	Fri, 19 Jul 2019 08:11:06 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr810082.outbound.protection.outlook.com [40.107.81.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD7026E48D
 for <amd-gfx@lists.freedesktop.org>; Fri, 19 Jul 2019 08:11:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Kf6VIn+XArMwDeeyq/EqQn5SlX0JCkEVp2H//7ilL0utZKn5NPpAYHBf5zvjBYvPWhdTHx499dYr9KjSY8GGAjQuQeh6B20AU/iLgR6R7vDcVchEuc1nRfhBcQqQ1LBGDssYYnQeyrVUbQl+r1YVRPmxALac0NSHPVgk6+BkWpYGd7ePE8KJGuevrk0hmwfcBc8SLtG2aEd8orUu3ii/jLWSJ14XdN7zEunhp0QuoO/1QKjYCgqxNdg+Zcg1+6lFLyEO5QC5tJM44lcIS5MjgFzqVqeNPREK5Z4tnn4L3sRnV4qsycaO0No+2w2YXMJML6fLXPcXOqSraPYKA5X8RQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bvW/EwkuUjNmsIAvgEh1ydpmX77uITsXZsnxnaXfxkQ=;
 b=ZMWaWCSrUdU+cYudrtGlAxZQMoy1466ziWMQSy9+2r2mHXGQy8ZSKQcXeZrKceuGQawoW9dncTlTLR18U4M8s67wU9DN+vjnlNlS9S7m5dhOnAt++CdMVfZ2zQMYtCbUeatrk9JPCF8Bd2//f7HhSLGxao/PYHEKYA+rVldV0a1v4CPx1T69sIK9BYDSpymeHI9bAYajv6CRjWg4T9o2joqchZdEr5Ox0OI2TdH2A3AULTgqPvPT1fqFhMWjABWcwuzOu0jJaxFLcwm3kMQ8qla0qxEzWDx3mAMpacckBnQJjcoEtQpnXw94iBVhz9Kmqsnje+ZqM4ksGDjuDlNJYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from MN2PR12MB3296.namprd12.prod.outlook.com (20.179.80.139) by
 MN2PR12MB4176.namprd12.prod.outlook.com (52.135.49.20) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.12; Fri, 19 Jul 2019 08:11:03 +0000
Received: from MN2PR12MB3296.namprd12.prod.outlook.com
 ([fe80::ad59:f055:2417:660f]) by MN2PR12MB3296.namprd12.prod.outlook.com
 ([fe80::ad59:f055:2417:660f%6]) with mapi id 15.20.2094.013; Fri, 19 Jul 2019
 08:11:03 +0000
From: "Wang, Kevin(Yang)" <Kevin1.Wang@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amd/powerplay: remove redundancy debug log in smu
Thread-Topic: [PATCH] drm/amd/powerplay: remove redundancy debug log in smu
Thread-Index: AQHVPgmBraNIoKF0a0GLLs6fq6STwA==
Date: Fri, 19 Jul 2019 08:11:02 +0000
Message-ID: <20190719081048.32034-1-kevin1.wang@amd.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HK0PR03CA0047.apcprd03.prod.outlook.com
 (2603:1096:203:2f::35) To MN2PR12MB3296.namprd12.prod.outlook.com
 (2603:10b6:208:aa::11)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.22.0
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 411ec685-0ff5-479b-4756-08d70c20a3f3
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:MN2PR12MB4176; 
x-ms-traffictypediagnostic: MN2PR12MB4176:
x-microsoft-antispam-prvs: <MN2PR12MB4176437385DA94BF84EC051AA2CB0@MN2PR12MB4176.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2512;
x-forefront-prvs: 01039C93E4
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(366004)(39860400002)(376002)(346002)(396003)(199004)(189003)(256004)(8936002)(26005)(50226002)(52116002)(68736007)(86362001)(186003)(25786009)(386003)(6506007)(102836004)(478600001)(8676002)(81156014)(7736002)(2501003)(476003)(81166006)(2616005)(14454004)(1076003)(2351001)(99286004)(486006)(3846002)(5660300002)(2906002)(4326008)(6916009)(6512007)(316002)(36756003)(53936002)(305945005)(6116002)(5640700003)(66946007)(66556008)(64756008)(66446008)(54906003)(66476007)(71190400001)(71200400001)(6436002)(6486002)(66066001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB4176;
 H:MN2PR12MB3296.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: CwILTr4QCyQiFTSNP6+3WLH72pxI9UDUmkm8iYP24r9JbPUWTEKEcNqJ9shntyosPGoazgkRnog//Xoa9n3b3PnA2XJvVxySR0MaaRWFXLSIsIws9ZmeSzWPgGWZufdQWLXOg+mCgzNN4bXmyMxDP3JXjJUdyQeycu0Cp7GzOPi+oRqVQ8cKBtlRQJPaR3jU/GB9+m4zX3g/wHXLKe0sR7ZIUCZfwQs28E0I9y97QZTzsxte76FtAQuL87yeJrFB4Is9YV7aujh4MjsvwqEhYV4hN0MXCYnkJFGWATYF9IwMDIObcStT86uMvjlJgmiMRBkNbONc2HaAoqau9ZGifM+7i4Vn7c24gF1Um03HPjzjGLAZBNhP1Diu0AXSvvCa2Q19JhoGBJ/HYtygzxhS3WiaW3rImSlhDtouyTRV5DA=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 411ec685-0ff5-479b-4756-08d70c20a3f3
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jul 2019 08:11:02.8628 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kevwa@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4176
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bvW/EwkuUjNmsIAvgEh1ydpmX77uITsXZsnxnaXfxkQ=;
 b=yjz1gXdPcTeZlSGnku6HvXlvZNBcj6d7ff7/tKMsI7/9xNF4j7Iva13Bz1d4Kie9IeLYg1E0gpaR+c2ZW8s7Iw5yecM0wBfYSEqDZG7SSl+P2svuh9BRWbk2ga/XuM8pbZLxsTWWc5b3GSflR/KiRksME1oIAst5PwaEryqNOKY=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Kevin1.Wang@amd.com; 
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
Cc: "Huang, Ray" <Ray.Huang@amd.com>, "Feng, Kenneth" <Kenneth.Feng@amd.com>,
 "Wang, Kevin\(Yang\)" <Kevin1.Wang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

cmVtb3ZlIHJlZHVuZGFjeSBkZWJ1ZyBsb2cgaW4gc211LgplZzoKWyA2ODk3Ljk2OTQ0N10gYW1k
Z3B1OiBbcG93ZXJwbGF5XSBzbXUgMTEgY2xrIGRwbSBmZWF0dXJlIDEgaXMgbm90IGVuYWJsZWQK
WyA2ODk3Ljk2OTQ0OF0gYW1kZ3B1OiBbcG93ZXJwbGF5XSBzbXUgMTEgY2xrIGRwbSBmZWF0dXJl
IDEgaXMgbm90IGVuYWJsZWQKWyA2ODk3Ljk2OTQ0OF0gYW1kZ3B1OiBbcG93ZXJwbGF5XSBzbXUg
MTEgY2xrIGRwbSBmZWF0dXJlIDEgaXMgbm90IGVuYWJsZWQKWyA2ODk5LjAyNDExNF0gYW1kZ3B1
OiBbcG93ZXJwbGF5XSBVbnN1cHBvcnRlZCBTTVUgbWVzc2FnZTogMzgKWyA2ODk5LjAyNDE1MV0g
YW1kZ3B1OiBbcG93ZXJwbGF5XSBzbXUgMTEgY2xrIGRwbSBmZWF0dXJlIDEgaXMgbm90IGVuYWJs
ZWQKWyA2ODk5LjAyNDE1MV0gYW1kZ3B1OiBbcG93ZXJwbGF5XSBzbXUgMTEgY2xrIGRwbSBmZWF0
dXJlIDEgaXMgbm90IGVuYWJsZWQKWyA2ODk5LjAyNDE1Ml0gYW1kZ3B1OiBbcG93ZXJwbGF5XSBz
bXUgMTEgY2xrIGRwbSBmZWF0dXJlIDEgaXMgbm90IGVuYWJsZWQKWyA2OTAwLjA3ODI5Nl0gYW1k
Z3B1OiBbcG93ZXJwbGF5XSBVbnN1cHBvcnRlZCBTTVUgbWVzc2FnZTogMzgKWyA2OTAwLjA3ODMz
Ml0gYW1kZ3B1OiBbcG93ZXJwbGF5XSBzbXUgMTEgY2xrIGRwbSBmZWF0dXJlIDEgaXMgbm90IGVu
YWJsZWQKWyA2OTAwLjA3ODMzMl0gYW1kZ3B1OiBbcG93ZXJwbGF5XSBzbXUgMTEgY2xrIGRwbSBm
ZWF0dXJlIDEgaXMgbm90IGVuYWJsZWQKWyA2OTAwLjA3ODMzM10gYW1kZ3B1OiBbcG93ZXJwbGF5
XSBzbXUgMTEgY2xrIGRwbSBmZWF0dXJlIDEgaXMgbm90IGVuYWJsZWQKWyA2OTAxLjEzMzIzMF0g
YW1kZ3B1OiBbcG93ZXJwbGF5XSBVbnN1cHBvcnRlZCBTTVUgbWVzc2FnZTogMzgKClNpZ25lZC1v
ZmYtYnk6IEtldmluIFdhbmcgPGtldmluMS53YW5nQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUv
ZHJtL2FtZC9wb3dlcnBsYXkvYW1kZ3B1X3NtdS5jIHwgMSAtCiBkcml2ZXJzL2dwdS9kcm0vYW1k
L3Bvd2VycGxheS9uYXZpMTBfcHB0LmMgfCA2IC0tLS0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9w
b3dlcnBsYXkvdmVnYTIwX3BwdC5jIHwgNiAtLS0tLS0KIDMgZmlsZXMgY2hhbmdlZCwgMTMgZGVs
ZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvYW1k
Z3B1X3NtdS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvYW1kZ3B1X3NtdS5jCmlu
ZGV4IDM5MWNlN2MwOGM2Ni4uMDViOTFiYzUwNTRjIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9k
cm0vYW1kL3Bvd2VycGxheS9hbWRncHVfc211LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9w
b3dlcnBsYXkvYW1kZ3B1X3NtdS5jCkBAIC0yMzYsNyArMjM2LDYgQEAgYm9vbCBzbXVfY2xrX2Rw
bV9pc19lbmFibGVkKHN0cnVjdCBzbXVfY29udGV4dCAqc211LCBlbnVtIHNtdV9jbGtfdHlwZSBj
bGtfdHlwZSkKIAl9CiAKIAlpZighc211X2ZlYXR1cmVfaXNfZW5hYmxlZChzbXUsIGZlYXR1cmVf
aWQpKSB7Ci0JCXByX3dhcm4oInNtdSAlZCBjbGsgZHBtIGZlYXR1cmUgJWQgaXMgbm90IGVuYWJs
ZWRcbiIsIGNsa190eXBlLCBmZWF0dXJlX2lkKTsKIAkJcmV0dXJuIGZhbHNlOwogCX0KIApkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvbmF2aTEwX3BwdC5jIGIvZHJp
dmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvbmF2aTEwX3BwdC5jCmluZGV4IGEzYzgyODY3ZTQz
MS4uNDZlMjkxM2U0YWY0IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxh
eS9uYXZpMTBfcHB0LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvbmF2aTEw
X3BwdC5jCkBAIC0yMTcsNyArMjE3LDYgQEAgc3RhdGljIGludCBuYXZpMTBfZ2V0X3NtdV9tc2df
aW5kZXgoc3RydWN0IHNtdV9jb250ZXh0ICpzbWMsIHVpbnQzMl90IGluZGV4KQogCiAJbWFwcGlu
ZyA9IG5hdmkxMF9tZXNzYWdlX21hcFtpbmRleF07CiAJaWYgKCEobWFwcGluZy52YWxpZF9tYXBw
aW5nKSkgewotCQlwcl93YXJuKCJVbnN1cHBvcnRlZCBTTVUgbWVzc2FnZTogJWRcbiIsIGluZGV4
KTsKIAkJcmV0dXJuIC1FSU5WQUw7CiAJfQogCkBAIC0yMzMsNyArMjMyLDYgQEAgc3RhdGljIGlu
dCBuYXZpMTBfZ2V0X3NtdV9jbGtfaW5kZXgoc3RydWN0IHNtdV9jb250ZXh0ICpzbWMsIHVpbnQz
Ml90IGluZGV4KQogCiAJbWFwcGluZyA9IG5hdmkxMF9jbGtfbWFwW2luZGV4XTsKIAlpZiAoISht
YXBwaW5nLnZhbGlkX21hcHBpbmcpKSB7Ci0JCXByX3dhcm4oIlVuc3VwcG9ydGVkIFNNVSBjbG9j
azogJWRcbiIsIGluZGV4KTsKIAkJcmV0dXJuIC1FSU5WQUw7CiAJfQogCkBAIC0yNDksNyArMjQ3
LDYgQEAgc3RhdGljIGludCBuYXZpMTBfZ2V0X3NtdV9mZWF0dXJlX2luZGV4KHN0cnVjdCBzbXVf
Y29udGV4dCAqc21jLCB1aW50MzJfdCBpbmRleCkKIAogCW1hcHBpbmcgPSBuYXZpMTBfZmVhdHVy
ZV9tYXNrX21hcFtpbmRleF07CiAJaWYgKCEobWFwcGluZy52YWxpZF9tYXBwaW5nKSkgewotCQlw
cl93YXJuKCJVbnN1cHBvcnRlZCBTTVUgZmVhdHVyZTogJWRcbiIsIGluZGV4KTsKIAkJcmV0dXJu
IC1FSU5WQUw7CiAJfQogCkBAIC0yNjUsNyArMjYyLDYgQEAgc3RhdGljIGludCBuYXZpMTBfZ2V0
X3NtdV90YWJsZV9pbmRleChzdHJ1Y3Qgc211X2NvbnRleHQgKnNtYywgdWludDMyX3QgaW5kZXgp
CiAKIAltYXBwaW5nID0gbmF2aTEwX3RhYmxlX21hcFtpbmRleF07CiAJaWYgKCEobWFwcGluZy52
YWxpZF9tYXBwaW5nKSkgewotCQlwcl93YXJuKCJVbnN1cHBvcnRlZCBTTVUgdGFibGU6ICVkXG4i
LCBpbmRleCk7CiAJCXJldHVybiAtRUlOVkFMOwogCX0KIApAQCAtMjgxLDcgKzI3Nyw2IEBAIHN0
YXRpYyBpbnQgbmF2aTEwX2dldF9wd3Jfc3JjX2luZGV4KHN0cnVjdCBzbXVfY29udGV4dCAqc21j
LCB1aW50MzJfdCBpbmRleCkKIAogCW1hcHBpbmcgPSBuYXZpMTBfcHdyX3NyY19tYXBbaW5kZXhd
OwogCWlmICghKG1hcHBpbmcudmFsaWRfbWFwcGluZykpIHsKLQkJcHJfd2FybigiVW5zdXBwb3J0
ZWQgcG93ZXIgc291cmNlOiAlZFxuIiwgaW5kZXgpOwogCQlyZXR1cm4gLUVJTlZBTDsKIAl9CiAK
QEAgLTI5OCw3ICsyOTMsNiBAQCBzdGF0aWMgaW50IG5hdmkxMF9nZXRfd29ya2xvYWRfdHlwZShz
dHJ1Y3Qgc211X2NvbnRleHQgKnNtdSwgZW51bSBQUF9TTUNfUE9XRVJfUAogCiAJbWFwcGluZyA9
IG5hdmkxMF93b3JrbG9hZF9tYXBbcHJvZmlsZV07CiAJaWYgKCEobWFwcGluZy52YWxpZF9tYXBw
aW5nKSkgewotCQlwcl93YXJuKCJVbnN1cHBvcnRlZCB3b3JrbG9hZDogJWRcbiIsIChpbnQpcHJv
ZmlsZSk7CiAJCXJldHVybiAtRUlOVkFMOwogCX0KIApkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL2FtZC9wb3dlcnBsYXkvdmVnYTIwX3BwdC5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dl
cnBsYXkvdmVnYTIwX3BwdC5jCmluZGV4IGZmNzRhYzc2ODA1ZC4uYmNkMGVmYWY3YmJkIDEwMDY0
NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS92ZWdhMjBfcHB0LmMKKysrIGIv
ZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvdmVnYTIwX3BwdC5jCkBAIC0yMzIsNyArMjMy
LDYgQEAgc3RhdGljIGludCB2ZWdhMjBfZ2V0X3NtdV90YWJsZV9pbmRleChzdHJ1Y3Qgc211X2Nv
bnRleHQgKnNtYywgdWludDMyX3QgaW5kZXgpCiAKIAltYXBwaW5nID0gdmVnYTIwX3RhYmxlX21h
cFtpbmRleF07CiAJaWYgKCEobWFwcGluZy52YWxpZF9tYXBwaW5nKSkgewotCQlwcl93YXJuKCJV
bnN1cHBvcnRlZCBTTVUgdGFibGU6ICVkXG4iLCBpbmRleCk7CiAJCXJldHVybiAtRUlOVkFMOwog
CX0KIApAQCAtMjQ4LDcgKzI0Nyw2IEBAIHN0YXRpYyBpbnQgdmVnYTIwX2dldF9wd3Jfc3JjX2lu
ZGV4KHN0cnVjdCBzbXVfY29udGV4dCAqc21jLCB1aW50MzJfdCBpbmRleCkKIAogCW1hcHBpbmcg
PSB2ZWdhMjBfcHdyX3NyY19tYXBbaW5kZXhdOwogCWlmICghKG1hcHBpbmcudmFsaWRfbWFwcGlu
ZykpIHsKLQkJcHJfd2FybigiVW5zdXBwb3J0ZWQgcG93ZXIgc291cmNlOiAlZFxuIiwgaW5kZXgp
OwogCQlyZXR1cm4gLUVJTlZBTDsKIAl9CiAKQEAgLTI2NCw3ICsyNjIsNiBAQCBzdGF0aWMgaW50
IHZlZ2EyMF9nZXRfc211X2ZlYXR1cmVfaW5kZXgoc3RydWN0IHNtdV9jb250ZXh0ICpzbWMsIHVp
bnQzMl90IGluZGV4KQogCiAJbWFwcGluZyA9IHZlZ2EyMF9mZWF0dXJlX21hc2tfbWFwW2luZGV4
XTsKIAlpZiAoIShtYXBwaW5nLnZhbGlkX21hcHBpbmcpKSB7Ci0JCXByX3dhcm4oIlVuc3VwcG9y
dGVkIFNNVSBmZWF0dXJlOiAlZFxuIiwgaW5kZXgpOwogCQlyZXR1cm4gLUVJTlZBTDsKIAl9CiAK
QEAgLTI4MCw3ICsyNzcsNiBAQCBzdGF0aWMgaW50IHZlZ2EyMF9nZXRfc211X2Nsa19pbmRleChz
dHJ1Y3Qgc211X2NvbnRleHQgKnNtYywgdWludDMyX3QgaW5kZXgpCiAKIAltYXBwaW5nID0gdmVn
YTIwX2Nsa19tYXBbaW5kZXhdOwogCWlmICghKG1hcHBpbmcudmFsaWRfbWFwcGluZykpIHsKLQkJ
cHJfd2FybigiVW5zdXBwb3J0ZWQgU01VIGNsb2NrOiAlZFxuIiwgaW5kZXgpOwogCQlyZXR1cm4g
LUVJTlZBTDsKIAl9CiAKQEAgLTI5Niw3ICsyOTIsNiBAQCBzdGF0aWMgaW50IHZlZ2EyMF9nZXRf
c211X21zZ19pbmRleChzdHJ1Y3Qgc211X2NvbnRleHQgKnNtYywgdWludDMyX3QgaW5kZXgpCiAK
IAltYXBwaW5nID0gdmVnYTIwX21lc3NhZ2VfbWFwW2luZGV4XTsKIAlpZiAoIShtYXBwaW5nLnZh
bGlkX21hcHBpbmcpKSB7Ci0JCXByX3dhcm4oIlVuc3VwcG9ydGVkIFNNVSBtZXNzYWdlOiAlZFxu
IiwgaW5kZXgpOwogCQlyZXR1cm4gLUVJTlZBTDsKIAl9CiAKQEAgLTMxMiw3ICszMDcsNiBAQCBz
dGF0aWMgaW50IHZlZ2EyMF9nZXRfd29ya2xvYWRfdHlwZShzdHJ1Y3Qgc211X2NvbnRleHQgKnNt
dSwgZW51bSBQUF9TTUNfUE9XRVJfUAogCiAJbWFwcGluZyA9IHZlZ2EyMF93b3JrbG9hZF9tYXBb
cHJvZmlsZV07CiAJaWYgKCEobWFwcGluZy52YWxpZF9tYXBwaW5nKSkgewotCQlwcl93YXJuKCJV
bnN1cHBvcnRlZCBTTVUgd29ya2xvYWQ6ICVkXG4iLCAoaW50KXByb2ZpbGUpOwogCQlyZXR1cm4g
LUVJTlZBTDsKIAl9CiAKLS0gCjIuMjIuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9hbWQtZ2Z4
