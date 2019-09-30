Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 071B4C1A51
	for <lists+amd-gfx@lfdr.de>; Mon, 30 Sep 2019 05:20:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F567899F2;
	Mon, 30 Sep 2019 03:20:06 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750057.outbound.protection.outlook.com [40.107.75.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18EF7899F2
 for <amd-gfx@lists.freedesktop.org>; Mon, 30 Sep 2019 03:20:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l+1VFpbvSye4QED7erdO6x70GH0sRCJVybt2QeTJRQ801ok2ujea7Ds/rPbqKR/KI29mloTlYEgTumNZvzBwJyUINZKG5ZKLBEnSgfdJDWM0OwiA1aMIMvd/wRUk0ZzPwoVw9cJzWygdqUSw12+ssa61/6ltwNdTkM/lGELB2ZGqFv+R7UtK7uBHtLqMjsldUoowBR7uFH6Rjq6qdBXQPEugw2InMZPjQki7RMXspX+e0j7tfP1B9rOfKo5wK9gYL3Jl/nbVOPI4rHhyH/tLF7HOMZU6ICv25s1J2s47p0pGWi/iWAz7i9q5AvjGJ8uzUeL4cUvzyROVGY/xWeoMfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pcs2exTwJEIGyyN5691rLpFd2n74H2oVSHs/d2EI6b8=;
 b=g7HuALiHUUbjAGUyF+HZRv9XtsoYhHPlm07lqEsPb5dNA53y1wE0e37eWSJuTUWjTUcPhkVcAkTqaY+uJHQ7I+aFuTvdNJ8Lm05kDFVN6qRbMNKqyneQ+75+1iSc5SQjGeI4xolxhBi7A03HnysSPqM9VBLdkeBr2eBL/TpF0kSqXhrGq8FN0IHQUPR7IuIINNL2Nxf+sfgLr0xnb9EEfibes0g8g1eWUE8Wvl4L8lE58h9am6SvSYnFRCtf4mFzJPbecQY3k/QCaAmy30uz3fNv0S+npEToLLYmYCmlS/GEhWU2DmxgHUbxIayTwCWhbQXTDe689chHD/2lln+J7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3054.namprd12.prod.outlook.com (20.178.244.79) by
 MN2PR12MB3629.namprd12.prod.outlook.com (20.178.242.221) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.20; Mon, 30 Sep 2019 03:20:01 +0000
Received: from MN2PR12MB3054.namprd12.prod.outlook.com
 ([fe80::a404:dfd4:47a9:497]) by MN2PR12MB3054.namprd12.prod.outlook.com
 ([fe80::a404:dfd4:47a9:497%7]) with mapi id 15.20.2305.017; Mon, 30 Sep 2019
 03:20:01 +0000
From: "Zhou1, Tao" <Tao.Zhou1@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "Grodzovsky, Andrey" <Andrey.Grodzovsky@amd.com>, "Chen, Guchun"
 <Guchun.Chen@amd.com>, "Zhang, Hawking" <Hawking.Zhang@amd.com>
Subject: [PATCH 3/3] drm/amdgpu: reuse code of ras bad page's bo create
Thread-Topic: [PATCH 3/3] drm/amdgpu: reuse code of ras bad page's bo create
Thread-Index: AQHVdz3x+IXNwwiq9UeluiB97bUvVA==
Date: Mon, 30 Sep 2019 03:20:00 +0000
Message-ID: <20190930031938.10982-3-tao.zhou1@amd.com>
References: <20190930031938.10982-1-tao.zhou1@amd.com>
In-Reply-To: <20190930031938.10982-1-tao.zhou1@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HK0PR01CA0006.apcprd01.prod.exchangelabs.com
 (2603:1096:203:92::18) To MN2PR12MB3054.namprd12.prod.outlook.com
 (2603:10b6:208:d1::15)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f9af836b-9ff2-43a8-fe93-08d74555140e
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:MN2PR12MB3629; 
x-ms-traffictypediagnostic: MN2PR12MB3629:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB36290FD2FAC876BDEAD7028DB0820@MN2PR12MB3629.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-forefront-prvs: 01762B0D64
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(376002)(396003)(366004)(136003)(39860400002)(199004)(189003)(66066001)(26005)(71200400001)(71190400001)(1076003)(5660300002)(316002)(186003)(76176011)(3846002)(2906002)(6116002)(52116002)(66556008)(66476007)(64756008)(66946007)(6486002)(102836004)(86362001)(99286004)(6636002)(6436002)(386003)(14444005)(6506007)(50226002)(305945005)(256004)(6512007)(81166006)(110136005)(476003)(2616005)(486006)(25786009)(7736002)(4326008)(478600001)(66446008)(36756003)(11346002)(8936002)(8676002)(446003)(14454004)(2501003)(81156014);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3629;
 H:MN2PR12MB3054.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 0vNLz2RMg37k3456X0RGcNlupK79nGbgmCVhE9x76P99b4BT6M6VetEk0TTux6+VOZvZTg8+9ocZYGUs51mSSkpIncWjpt6SaITopvCK0hlIEmWAywl3DhCLL4uVjapzj8HlMy4DBAxS3M+4HWzP277Gw8S2RZzoRuOiZz8d217e66hNOQR64qdvcpJjJf7QXSKatTcFbwfvbYcFwehAIMkKEYFDurePJCFRzYtjG9xlo/SGVDR5xMWhIKbmPlB/izFdcq6mJDP69FtutZpnJmmabhtj7PApYNOXqDpkhfKapBFOQGkPF6hq1iU6RKDsHhmCgorVyi3nD9s/Xxqo+/Rj0MRRSD0SgpUeUBEEk9HSe6UMq1bsrr7/Q2EM8BeIiuoBqqZbeby6dJglnkfmfPIi1+lWTl5m09F9eYxWAzc=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f9af836b-9ff2-43a8-fe93-08d74555140e
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Sep 2019 03:20:00.9816 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Rz1O6nsLgvKJPrXTzp4GpOrWZbVfPNSmBZv3+hX7nGoWF5Opw4z7dg1PGUPCHSN2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3629
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pcs2exTwJEIGyyN5691rLpFd2n74H2oVSHs/d2EI6b8=;
 b=QmHSY+ONV1hc4k7+zbD4OcloK8lkcyUjCBBfM5OTOek0zFYitv1qdzzqz+i35yjajoSwoPSUfTCD5Dq6fLb0VPE3UbqXb6BRo4knBRk0EzBg17HerjN4JRrsM2re0SgO3NUQPWijXWY5/iUOI7BtS1NJy0i2M/VWZ+LkS81TFCE=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Tao.Zhou1@amd.com; 
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
Cc: "Zhou1, Tao" <Tao.Zhou1@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

aW1wbGVtZW50IHJhc19jcmVhdGVfYmFkX3BhZ2VzX2JvIHRvIHNpbXBsaWZ5IHJhcyBjb2RlCgpT
aWduZWQtb2ZmLWJ5OiBUYW8gWmhvdSA8dGFvLnpob3UxQGFtZC5jb20+Ci0tLQogZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Jhcy5jIHwgNzIgKysrKysrKysrKystLS0tLS0tLS0t
LS0tLQogMSBmaWxlIGNoYW5nZWQsIDMxIGluc2VydGlvbnMoKyksIDQxIGRlbGV0aW9ucygtKQoK
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXMuYyBiL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXMuYwppbmRleCBkMWJhZmE5MmNhOTEu
LmZlM2E1N2U1NjdjOCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1k
Z3B1X3Jhcy5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXMuYwpA
QCAtMTQzMCw0MSArMTQzMCw1MyBAQCBzdGF0aWMgaW50IGFtZGdwdV9yYXNfbG9hZF9iYWRfcGFn
ZXMoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpCiAJcmV0dXJuIHJldDsKIH0KIAotLyogY2Fs
bGVkIGluIGdwdSByZWNvdmVyeS9pbml0ICovCi1pbnQgYW1kZ3B1X3Jhc19yZXNlcnZlX2JhZF9w
YWdlcyhzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikKK3N0YXRpYyB2b2lkIGFtZGdwdV9yYXNf
Y3JlYXRlX2JhZF9wYWdlc19ibyhzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikKIHsKKwkvKiBO
b3RlOiB0aGUgY2FsbGVyIHNob3VsZCBndWFyYW50ZWUgY29uIGFuZCBkYXRhIGFyZSBub3QgTlVM
TCAqLwogCXN0cnVjdCBhbWRncHVfcmFzICpjb24gPSBhbWRncHVfcmFzX2dldF9jb250ZXh0KGFk
ZXYpOwotCXN0cnVjdCByYXNfZXJyX2hhbmRsZXJfZGF0YSAqZGF0YTsKKwlzdHJ1Y3QgcmFzX2Vy
cl9oYW5kbGVyX2RhdGEgKmRhdGEgPSBjb24tPmVoX2RhdGE7CiAJdWludDY0X3QgYnA7Ci0Jc3Ry
dWN0IGFtZGdwdV9ibyAqYm8gPSBOVUxMOwotCWludCBpLCByZXQgPSAwOwotCi0JaWYgKCFjb24g
fHwgIWNvbi0+ZWhfZGF0YSkKLQkJcmV0dXJuIDA7CisJc3RydWN0IGFtZGdwdV9ibyAqYm87CisJ
aW50IGk7CiAKLQltdXRleF9sb2NrKCZjb24tPnJlY292ZXJ5X2xvY2spOwotCWRhdGEgPSBjb24t
PmVoX2RhdGE7Ci0JaWYgKCFkYXRhKQotCQlnb3RvIG91dDsKLQkvKiByZXNlcnZlIHZyYW0gYXQg
ZHJpdmVyIHBvc3Qgc3RhZ2UuICovCiAJZm9yIChpID0gZGF0YS0+bGFzdF9yZXNlcnZlZDsgaSA8
IGRhdGEtPmNvdW50OyBpKyspIHsKKwkJYm8gPSBOVUxMOwogCQlicCA9IGRhdGEtPmJwc1tpXS5y
ZXRpcmVkX3BhZ2U7CiAKLQkJLyogVGhlcmUgYXJlIHR3byBjYXNlcyBvZiByZXNlcnZlIGVycm9y
IHNob3VsZCBiZSBpZ25vcmVkOgorCQkvKiBUaGVyZSBhcmUgdGhyZWUgY2FzZXMgb2YgcmVzZXJ2
ZSBlcnJvciBzaG91bGQgYmUgaWdub3JlZDoKIAkJICogMSkgYSByYXMgYmFkIHBhZ2UgaGFzIGJl
ZW4gYWxsb2NhdGVkICh1c2VkIGJ5IHNvbWVvbmUpOwogCQkgKiAyKSBhIHJhcyBiYWQgcGFnZSBo
YXMgYmVlbiByZXNlcnZlZCAoZHVwbGljYXRlIGVycm9yIGluamVjdGlvbgogCQkgKiAgICBmb3Ig
b25lIHBhZ2UpOworCQkgKiAzKSBibyBpbmZvIGlzbid0IGxvc3QgaW4gZ3B1IHJlc2V0CiAJCSAq
LwogCQlpZiAoYW1kZ3B1X2JvX2NyZWF0ZV9rZXJuZWxfYXQoYWRldiwgYnAgPDwgQU1ER1BVX0dQ
VV9QQUdFX1NISUZULAogCQkJCQkgICAgICAgQU1ER1BVX0dQVV9QQUdFX1NJWkUsCiAJCQkJCSAg
ICAgICBBTURHUFVfR0VNX0RPTUFJTl9WUkFNLAogCQkJCQkgICAgICAgJmJvLCBOVUxMKSkKLQkJ
CURSTV9XQVJOKCJSQVMgV0FSTjogcmVzZXJ2ZSB2cmFtIGZvciByZXRpcmVkIHBhZ2UgJWxseCBm
YWlsXG4iLCBicCk7Ci0KLQkJZGF0YS0+YnBzX2JvW2ldID0gYm87CisJCQlEUk1fTk9URSgiUkFT
IE5PVEU6IHJlc2VydmUgdnJhbSBmb3IgcmV0aXJlZCBwYWdlIDB4JWxseCBmYWlsXG4iLCBicCk7
CisJCWVsc2UKKwkJCWRhdGEtPmJwc19ib1tpXSA9IGJvOwogCQlkYXRhLT5sYXN0X3Jlc2VydmVk
ID0gaSArIDE7Ci0JCWJvID0gTlVMTDsKIAl9Cit9CisKKy8qIGNhbGxlZCBpbiBncHUgcmVjb3Zl
cnkvaW5pdCAqLworaW50IGFtZGdwdV9yYXNfcmVzZXJ2ZV9iYWRfcGFnZXMoc3RydWN0IGFtZGdw
dV9kZXZpY2UgKmFkZXYpCit7CisJc3RydWN0IGFtZGdwdV9yYXMgKmNvbiA9IGFtZGdwdV9yYXNf
Z2V0X2NvbnRleHQoYWRldik7CisJc3RydWN0IHJhc19lcnJfaGFuZGxlcl9kYXRhICpkYXRhOwor
CWludCByZXQgPSAwOworCisJaWYgKCFjb24gfHwgIWNvbi0+ZWhfZGF0YSkKKwkJcmV0dXJuIDA7
CisKKwltdXRleF9sb2NrKCZjb24tPnJlY292ZXJ5X2xvY2spOworCWRhdGEgPSBjb24tPmVoX2Rh
dGE7CisJaWYgKCFkYXRhKQorCQlnb3RvIG91dDsKKworCS8qIHJlc2VydmUgdnJhbSBhdCBkcml2
ZXIgcG9zdCBzdGFnZS4gKi8KKwlhbWRncHVfcmFzX2NyZWF0ZV9iYWRfcGFnZXNfYm8oYWRldik7
CiAKIAkvKiBjb250aW51ZSB0byBzYXZlIGJhZCBwYWdlcyB0byBlZXByb20gZXZlbiByZWVzcnZl
X3ZyYW0gZmFpbHMgKi8KIAlyZXQgPSBhbWRncHVfcmFzX3NhdmVfYmFkX3BhZ2VzKGFkZXYpOwpA
QCAtMTU4Myw5ICsxNTk1LDYgQEAgdm9pZCBhbWRncHVfcmFzX3JlY292ZXJ5X3Jlc2V0KHN0cnVj
dCBhbWRncHVfZGV2aWNlICphZGV2KQogewogCXN0cnVjdCBhbWRncHVfcmFzICpjb24gPSBhbWRn
cHVfcmFzX2dldF9jb250ZXh0KGFkZXYpOwogCXN0cnVjdCByYXNfZXJyX2hhbmRsZXJfZGF0YSAq
ZGF0YTsKLQl1aW50NjRfdCBicDsKLQlzdHJ1Y3QgYW1kZ3B1X2JvICpibyA9IE5VTEw7Ci0JaW50
IGk7CiAKIAlpZiAoIWNvbiB8fCAhY29uLT5laF9kYXRhKQogCQlyZXR1cm47CkBAIC0xNjAwLDI2
ICsxNjA5LDcgQEAgdm9pZCBhbWRncHVfcmFzX3JlY292ZXJ5X3Jlc2V0KHN0cnVjdCBhbWRncHVf
ZGV2aWNlICphZGV2KQogCWRhdGEgPSBjb24tPmVoX2RhdGE7CiAJLyogZm9yY2UgdG8gcmVzZXJ2
ZSBhbGwgcmV0aXJlZCBwYWdlIGFnYWluICovCiAJZGF0YS0+bGFzdF9yZXNlcnZlZCA9IDA7Ci0K
LQlmb3IgKGkgPSBkYXRhLT5sYXN0X3Jlc2VydmVkOyBpIDwgZGF0YS0+Y291bnQ7IGkrKykgewot
CQlicCA9IGRhdGEtPmJwc1tpXS5yZXRpcmVkX3BhZ2U7Ci0KLQkJLyogVGhlcmUgYXJlIHRocmVl
IGNhc2VzIG9mIHJlc2VydmUgZXJyb3Igc2hvdWxkIGJlIGlnbm9yZWQ6Ci0JCSAqIDEpIGEgcmFz
IGJhZCBwYWdlIGhhcyBiZWVuIGFsbG9jYXRlZCAodXNlZCBieSBzb21lb25lKTsKLQkJICogMikg
YSByYXMgYmFkIHBhZ2UgaGFzIGJlZW4gcmVzZXJ2ZWQgKGR1cGxpY2F0ZSBlcnJvciBpbmplY3Rp
b24KLQkJICogICAgZm9yIG9uZSBwYWdlKTsKLQkJICogMykgYm8gaW5mbyBpc24ndCBsb3N0IGlu
IGdwdSByZXNldAotCQkgKi8KLQkJaWYgKGFtZGdwdV9ib19jcmVhdGVfa2VybmVsX2F0KGFkZXYs
IGJwIDw8IEFNREdQVV9HUFVfUEFHRV9TSElGVCwKLQkJCQkJICAgICAgIEFNREdQVV9HUFVfUEFH
RV9TSVpFLAotCQkJCQkgICAgICAgQU1ER1BVX0dFTV9ET01BSU5fVlJBTSwKLQkJCQkJICAgICAg
ICZibywgTlVMTCkpCi0JCQlEUk1fTk9URSgiUkFTIE5PVEU6IHJlY3JlYXRlIGJvIGZvciByZXRp
cmVkIHBhZ2UgMHglbGx4IGZhaWxcbiIsIGJwKTsKLQkJZWxzZQotCQkJZGF0YS0+YnBzX2JvW2ld
ID0gYm87Ci0JCWRhdGEtPmxhc3RfcmVzZXJ2ZWQgPSBpICsgMTsKLQkJYm8gPSBOVUxMOwotCX0K
KwlhbWRncHVfcmFzX2NyZWF0ZV9iYWRfcGFnZXNfYm8oYWRldik7CiB9CiAvKiByZWNvdmVyeSBl
bmQgKi8KIAotLSAKMi4xNy4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1n
Zng=
