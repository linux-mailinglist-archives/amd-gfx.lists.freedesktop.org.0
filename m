Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 16AFEB7BBE
	for <lists+amd-gfx@lfdr.de>; Thu, 19 Sep 2019 16:10:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9627A6F860;
	Thu, 19 Sep 2019 14:10:46 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700045.outbound.protection.outlook.com [40.107.70.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 430F86F860
 for <amd-gfx@lists.freedesktop.org>; Thu, 19 Sep 2019 14:10:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lNkp9pa4yeb2IHkIQjqlMbNoM8AeNY9ECBsd9yVsK9JyL6xn4IjKBBMUBHPDlLgj7vyZcmorG4I9E6kDHjVWfP9EQ76KE/rYvskqAzifEKuhfMSmpu7UVMEkyvlgUxaaaPZ5mh8wxzUF/V0f5g3WIVuQvDNX+wzOTJZjK2PzGR2QZz0r7fAg1T2vRK4Q1AdGn0kLVjGuNAemnXCDW4DSz19Q7bNaNbhRiWNGzcQukdzaUU87b3tJWtnyoBIblwYIhdKMgbfLjExRq+Mwkwux0p08lz2hwaJ82FUX86hEm77Esvdbdc5/wV26YSCzRDpqktlddmZJVTd/QQ8sWZIHjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M1r1L1XzYT0POGiamspf0tNs4sHooRlg9P/8/WBN6Eg=;
 b=OUgx7KZ7o0W/uXPZGzaggGxQRMv+7/jmO4P9r4oG33mQFkDK7px1HyPt9u6CLI5Lwc8085Fd9nIL/URgIzBSoARp1yWH6X8xq84mEyExguacRUJjFh09DQYoF/mEoyu4Zx1FBdW5lnjgv6DYdtbmIy0ihPAPo82k27u6pS53/QJpwcgM2Fnl2GbMI0d9F+XQLbX0TxNx22ZclWmJUhNm9bShlD6JER7933INAFD64xUpWI7OWL1QpqH9XYYXDIFgAzoBatvqNcDel7gHnA/F14hISbb5MEs3hD8zOAG6gCR7Rdjl7fjFQT36rwXqe/0FNJtMDsfA9gMU/eMmmBrJZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from BYAPR12MB2806.namprd12.prod.outlook.com (20.176.254.20) by
 BYAPR12MB3589.namprd12.prod.outlook.com (20.178.197.23) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.22; Thu, 19 Sep 2019 14:10:43 +0000
Received: from BYAPR12MB2806.namprd12.prod.outlook.com
 ([fe80::c416:d75c:9f2f:9f11]) by BYAPR12MB2806.namprd12.prod.outlook.com
 ([fe80::c416:d75c:9f2f:9f11%7]) with mapi id 15.20.2263.023; Thu, 19 Sep 2019
 14:10:43 +0000
From: "Chen, Guchun" <Guchun.Chen@amd.com>
To: "Zhou1, Tao" <Tao.Zhou1@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>, "Zhang, Hawking" <Hawking.Zhang@amd.com>
Subject: RE: [PATCH 11/21] drm/amdgpu: add common gfx_ras_fini function
Thread-Topic: [PATCH 11/21] drm/amdgpu: add common gfx_ras_fini function
Thread-Index: AQHVbrmobhS+U6Q9KUareWmDsbdCY6czCgKQ
Date: Thu, 19 Sep 2019 14:10:43 +0000
Message-ID: <BYAPR12MB280656252D3E47587A1563B8F1890@BYAPR12MB2806.namprd12.prod.outlook.com>
References: <20190919071115.16552-1-tao.zhou1@amd.com>
 <20190919071115.16552-12-tao.zhou1@amd.com>
In-Reply-To: <20190919071115.16552-12-tao.zhou1@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.159.93.55]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 995a2f4e-1875-4a38-f86b-08d73d0b28e8
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600167)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BYAPR12MB3589; 
x-ms-traffictypediagnostic: BYAPR12MB3589:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR12MB358993CEB9ED8020D0791757F1890@BYAPR12MB3589.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3276;
x-forefront-prvs: 016572D96D
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(376002)(396003)(136003)(346002)(366004)(13464003)(189003)(199004)(14454004)(9686003)(81156014)(81166006)(8676002)(2501003)(55016002)(316002)(86362001)(33656002)(6246003)(6436002)(8936002)(25786009)(74316002)(2906002)(6636002)(6116002)(3846002)(305945005)(478600001)(7736002)(229853002)(99286004)(7696005)(486006)(26005)(186003)(5660300002)(66946007)(66066001)(66446008)(64756008)(66556008)(66476007)(52536014)(256004)(76176011)(71200400001)(71190400001)(446003)(102836004)(76116006)(6506007)(476003)(53546011)(11346002)(110136005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR12MB3589;
 H:BYAPR12MB2806.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: EZgFTqoypGg2yDbbBVBNrMTZbeZb5d0N5Olj1XL88XnZaKnCZeOoF0r1QkExqCAeC9CWNsYxWUpzkPjxGrhNoWbu1+I52DQxl4/iomFwzsGgSNSK55pIYmui8BXupzXkT5MK6jHVn4EeQC3L0sOSbvNejnNgg67NIA4c47IRY12+ftDZ0Ujkb/NHrbRN76SZy5ttKl5n9TrPh9Y6t97BiwK/cYwryct/BFWD3cNdfLhyDMcj5nUEwsu8Nd7LLCFK9VV4PlDcgbVWta8erawyi6DcYaUZVAl1ccqNdhyItPepHWozGxe2H8qoH5QgeWP9fErnZiap0OOv5fMliGYQRn/9kGGYjsmO7i8n0+iKEPPQaBxa6CNuIK0z7XUQdfXjGJZvSD7TNt2MfAz4kTV0g3T5/87W6yroNP0gCBqDeeo=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 995a2f4e-1875-4a38-f86b-08d73d0b28e8
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Sep 2019 14:10:43.6215 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +YFtbtem9lOZjWKiypRtkXoe5RlA5d50Hcmy24iqM1Y/Bp3Xclhf8ePOV2E+/r2Rn8Mx1WOcfni/dxtI7RgdUA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3589
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M1r1L1XzYT0POGiamspf0tNs4sHooRlg9P/8/WBN6Eg=;
 b=t0nVhpdjoXxe+QHti1f1+lpzWB/44W2aFAAvfsnKBsazn+0/m2lJrKtOsOxxMujA6kLdXoae9u6owFIy46JzKCITY0O5Q7nTfhr12c5BmmEUiIxqZkCJYkAPknRyUbR01b6sJmzpl8BKp9wY1C1OUrRUmrcnTFDWVSbPN3naWFE=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Guchun.Chen@amd.com; 
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Ci0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tCkZyb206IFpob3UxLCBUYW8gPFRhby5aaG91MUBh
bWQuY29tPiAKU2VudDogVGh1cnNkYXksIFNlcHRlbWJlciAxOSwgMjAxOSAzOjEzIFBNClRvOiBh
bWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgQ2hlbiwgR3VjaHVuIDxHdWNodW4uQ2hlbkBh
bWQuY29tPjsgWmhhbmcsIEhhd2tpbmcgPEhhd2tpbmcuWmhhbmdAYW1kLmNvbT4KQ2M6IFpob3Ux
LCBUYW8gPFRhby5aaG91MUBhbWQuY29tPgpTdWJqZWN0OiBbUEFUQ0ggMTEvMjFdIGRybS9hbWRn
cHU6IGFkZCBjb21tb24gZ2Z4X3Jhc19maW5pIGZ1bmN0aW9uCgpnZnhfcmFzX2ZpbmkgY2FuIGJl
IHNoYXJlZCBhbW9uZyBhbGwgZ2VuZXJhdGlvbnMgb2YgZ2Z4CgpTaWduZWQtb2ZmLWJ5OiBUYW8g
WmhvdSA8dGFvLnpob3UxQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
YW1kZ3B1X2dmeC5jIHwgMTUgKysrKysrKysrKysrKysrICBkcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9hbWRncHVfZ2Z4LmggfCAgMSArCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhf
djlfMC5jICAgfCAxNCArLS0tLS0tLS0tLS0tLQogMyBmaWxlcyBjaGFuZ2VkLCAxNyBpbnNlcnRp
b25zKCspLCAxMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9hbWRncHVfZ2Z4LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVf
Z2Z4LmMKaW5kZXggZTdkODdmNzE3NzM3Li40ZjYzNWYyOGViMzQgMTAwNjQ0Ci0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9nZnguYworKysgYi9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9hbWRncHVfZ2Z4LmMKQEAgLTY1MSwzICs2NTEsMTggQEAgaW50IGFtZGdwdV9n
ZnhfY3BfZWNjX2Vycm9yX2lycShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwKIAlhbWRncHVf
cmFzX2ludGVycnVwdF9kaXNwYXRjaChhZGV2LCAmaWhfZGF0YSk7CiAJcmV0dXJuIDA7CiB9CisK
K3ZvaWQgYW1kZ3B1X2dmeF9yYXNfZmluaShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikgewor
CWlmIChhbWRncHVfcmFzX2lzX3N1cHBvcnRlZChhZGV2LCBBTURHUFVfUkFTX0JMT0NLX19HRlgp
ICYmCisJCQlhZGV2LT5nZngucmFzX2lmKSB7CisJCXN0cnVjdCByYXNfY29tbW9uX2lmICpyYXNf
aWYgPSBhZGV2LT5nZngucmFzX2lmOworCQlzdHJ1Y3QgcmFzX2loX2lmIGloX2luZm8gPSB7CisJ
CQkuaGVhZCA9ICpyYXNfaWYsCisJCQkuY2IgPSBhbWRncHVfZ2Z4X3Byb2Nlc3NfcmFzX2RhdGFf
Y2IsCltHdWNodW5dSSBiZWxpZXZlIGdmeCByYXMgY2IgaGFzIGJlZW4gc3BlY2lmaWVkIGluIGdm
eCByYXMgaW5pdCBzZXF1ZW5jZS4gVGhlbiB0aGUgY2F1c2Ugc2V0IHR3aWNlIGhlcmUgaXMgdG8g
ZW5zdXJlIHRoZSBpbnRlcnJ1cHQgcmVtb3ZhbCBjYW4gYmUgZG9uZSBjb3JyZWN0bD8KKwkJfTsK
KworCQlhbWRncHVfcmFzX2xhdGVfZmluaShhZGV2LCByYXNfaWYsICZpaF9pbmZvKTsKKwkJa2Zy
ZWUocmFzX2lmKTsKKwl9Cit9CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9hbWRncHVfZ2Z4LmggYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZ2Z4LmgK
aW5kZXggNjAwNTk5MTgxNjIwLi44ZjJkMTM3ZjRkMjAgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9nZnguaAorKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9hbWRncHVfZ2Z4LmgKQEAgLTM5MSw0ICszOTEsNSBAQCBpbnQgYW1kZ3B1X2dmeF9wcm9j
ZXNzX3Jhc19kYXRhX2NiKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LCAgaW50IGFtZGdwdV9n
ZnhfY3BfZWNjX2Vycm9yX2lycShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwKIAkJCQkgIHN0
cnVjdCBhbWRncHVfaXJxX3NyYyAqc291cmNlLAogCQkJCSAgc3RydWN0IGFtZGdwdV9pdl9lbnRy
eSAqZW50cnkpOwordm9pZCBhbWRncHVfZ2Z4X3Jhc19maW5pKHN0cnVjdCBhbWRncHVfZGV2aWNl
ICphZGV2KTsKICNlbmRpZgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
Z2Z4X3Y5XzAuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92OV8wLmMKaW5kZXgg
MDhiODAxNTdkZjNhLi5hYmRiZDY5Mzk0ZTYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2dmeF92OV8wLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4
X3Y5XzAuYwpAQCAtMjMxNywxOSArMjMxNyw3IEBAIHN0YXRpYyBpbnQgZ2Z4X3Y5XzBfc3dfZmlu
aSh2b2lkICpoYW5kbGUpCiAJaW50IGk7CiAJc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYgPSAo
c3RydWN0IGFtZGdwdV9kZXZpY2UgKiloYW5kbGU7CiAKLQlpZiAoYW1kZ3B1X3Jhc19pc19zdXBw
b3J0ZWQoYWRldiwgQU1ER1BVX1JBU19CTE9DS19fR0ZYKSAmJgotCQkJYWRldi0+Z2Z4LnJhc19p
ZikgewotCQlzdHJ1Y3QgcmFzX2NvbW1vbl9pZiAqcmFzX2lmID0gYWRldi0+Z2Z4LnJhc19pZjsK
LQkJc3RydWN0IHJhc19paF9pZiBpaF9pbmZvID0gewotCQkJLmhlYWQgPSAqcmFzX2lmLAotCQl9
OwotCi0JCWFtZGdwdV9yYXNfZGVidWdmc19yZW1vdmUoYWRldiwgcmFzX2lmKTsKLQkJYW1kZ3B1
X3Jhc19zeXNmc19yZW1vdmUoYWRldiwgcmFzX2lmKTsKLQkJYW1kZ3B1X3Jhc19pbnRlcnJ1cHRf
cmVtb3ZlX2hhbmRsZXIoYWRldiwgICZpaF9pbmZvKTsKLQkJYW1kZ3B1X3Jhc19mZWF0dXJlX2Vu
YWJsZShhZGV2LCByYXNfaWYsIDApOwotCQlrZnJlZShyYXNfaWYpOwotCX0KKwlhbWRncHVfZ2Z4
X3Jhc19maW5pKGFkZXYpOwogCiAJZm9yIChpID0gMDsgaSA8IGFkZXYtPmdmeC5udW1fZ2Z4X3Jp
bmdzOyBpKyspCiAJCWFtZGdwdV9yaW5nX2ZpbmkoJmFkZXYtPmdmeC5nZnhfcmluZ1tpXSk7Ci0t
CjIuMTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
YW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
