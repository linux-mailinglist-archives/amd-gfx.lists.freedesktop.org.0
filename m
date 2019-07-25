Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 82CB1756A8
	for <lists+amd-gfx@lfdr.de>; Thu, 25 Jul 2019 20:15:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24EA86E7FD;
	Thu, 25 Jul 2019 18:15:39 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr730061.outbound.protection.outlook.com [40.107.73.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54EEB6E7FD
 for <amd-gfx@lists.freedesktop.org>; Thu, 25 Jul 2019 18:15:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BxiTaUVl42ekdKPc1We5QxgXaRaJWqxUrWi7SULb9owryh1UzRQcCjDb6TgCOLlS5f6MI8TpIyPdilrTigppLvwNsam2uTh1Mgh43ufRcUb/YsyxjD4QOAawNBy+E+mK2Z8XIr7l2mwZaGx2+sVCv7FMzdgE4JlyGASg53PJDL2iLqFby7Sw9RoCOB84WyHa6Q15O6wL8Q5Vd6+YAjo2k4cYscrNbkVEKE5tub9j+rrpGsoq5yw7ZxcOxTIZQBXnj3Y0JF4eoIfG0XHBIHFiO/9JF/yFECGmpcMwz88SHBJacowJvKzR239gNfoLCCwnQkhXfjpFr97SIaW79FQzHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xcYETmqP++NER3IQQHp23FJX3rZtZ3aZh9tJCHsbEBs=;
 b=XwvSLjIJTgMi12yM9P8juM+WF+FRMHOPQ6P8clKSXbOOnjahaLowassAslbFqNpH5qDRHeq4MaUFUMKOqH0lLt3etuXtASDLSHl/CE0M0BbiT+A7yPMzqnOQ0uv5latxsLhUdIoPMsortSA0i1vBMahr2NPBr/XNl8Kb0zn7WyIGU4vnRRYjl1GSZSXrNay+6bnrdOjVg9hNDkCi9GHfhAO9wcKcyxEV4N7fl9UGSLqPdNBneDxRh6TgmXhnsgj4luUuKtUoG9r2m7xobOjhOQyIh0uc/qM67bh13V90jqNsBSXVywsjJqiLBG+B4X3s7aHvJrax0tW5/SpGivEvQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from BN6PR1201MB0178.namprd12.prod.outlook.com (10.174.114.148) by
 BN6PR1201MB0003.namprd12.prod.outlook.com (10.172.111.151) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.17; Thu, 25 Jul 2019 18:15:36 +0000
Received: from BN6PR1201MB0178.namprd12.prod.outlook.com
 ([fe80::e14e:201c:e206:9346]) by BN6PR1201MB0178.namprd12.prod.outlook.com
 ([fe80::e14e:201c:e206:9346%7]) with mapi id 15.20.2094.013; Thu, 25 Jul 2019
 18:15:36 +0000
From: "Thai, Thong" <Thong.Thai@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v3 1/2] drm/amd/amdgpu/vcn_v2_0: Mark RB commands as KMD
 commands
Thread-Topic: [PATCH v3 1/2] drm/amd/amdgpu/vcn_v2_0: Mark RB commands as KMD
 commands
Thread-Index: AQHVQxT0X0EVv+XGEkifZPRxyRgLzw==
Date: Thu, 25 Jul 2019 18:15:36 +0000
Message-ID: <20190725181516.6114-1-thong.thai@amd.com>
Accept-Language: en-CA, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YT1PR01CA0035.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::48)
 To BN6PR1201MB0178.namprd12.prod.outlook.com
 (2603:10b6:405:55::20)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-originating-ip: [165.204.55.251]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3dee6f02-db56-49be-b580-08d7112c1700
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BN6PR1201MB0003; 
x-ms-traffictypediagnostic: BN6PR1201MB0003:
x-microsoft-antispam-prvs: <BN6PR1201MB0003E3BCA2FF94180B06223E9DC10@BN6PR1201MB0003.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-forefront-prvs: 0109D382B0
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(39860400002)(366004)(376002)(346002)(396003)(199004)(189003)(5640700003)(2501003)(478600001)(2351001)(14454004)(25786009)(6486002)(66946007)(53936002)(6512007)(66066001)(6436002)(6916009)(66556008)(66446008)(5660300002)(66476007)(86362001)(7736002)(316002)(81166006)(8676002)(36756003)(64756008)(476003)(4326008)(71190400001)(71200400001)(50226002)(81156014)(68736007)(2616005)(6116002)(6506007)(1076003)(386003)(102836004)(486006)(256004)(3846002)(2906002)(26005)(99286004)(52116002)(186003)(8936002)(305945005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR1201MB0003;
 H:BN6PR1201MB0178.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: PwCdF09PBGfQwqepJaNLYQtb5a9jpLsBy+l63oTTdo8aDf65ITVT/JREd2ljaqEz07Gu9sCjbrI0dk9pTSz/xVu1yQp+akd5vn7B5Ou51Lrmppsdn1//lLM2QA7rYoOcD4LbJmvu+akMA61vqKTf0FcCKwGwlzTrH4M97BNDfmvkRSaSWbegsvnkPA2R5OdMBUognE+XHkINjK5oZFYXHVzToOf8mNgvM4SLPNAK8+CXFQH30VZhB8re2bbsYWE/72EJ+zqBmh+HXHTpsIoic9LjDa1bFYm7fRoQ9wI+N7w7igQFz/xDYqUZc2fCQ47LETcmZwNyJaaZmPu3Yf8jHcYJrc7kaQAz1zJ6I2WHF+RXWpEWjp1UQh652tLaNHn/tZiaJVQXw2fSGNawNXygJkCV/u0E8J5MYyzcPVGQXyw=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3dee6f02-db56-49be-b580-08d7112c1700
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jul 2019 18:15:36.0879 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: thonthai@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR1201MB0003
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xcYETmqP++NER3IQQHp23FJX3rZtZ3aZh9tJCHsbEBs=;
 b=sfXO1HVOw5YlZUvygimZJqBKXyo/4YN71K9O+T51Znf93hbbVI+w4qEIkzYLMJIRk95A/ZNB+c07ziisENHMLbdt2j35K9RgBqCjcwjK7kWKDCehNviYV0hRA4+6ET9cADce29R2Uc6MgiS5+V4nzSpSmlHU2W2dmliH1BbkzIM=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Thong.Thai@amd.com; 
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
Cc: "Thai, Thong" <Thong.Thai@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

U2V0cyB0aGUgQ01EX1NPVVJDRSBiaXQgZm9yIFZDTiAyLjAgRGVjb2RlciBSaW5nIEJ1ZmZlciBj
b21tYW5kcy4gVGhpcwpiaXQgd2FzIHByZXZpb3VzbHkgc2V0IGJ5IHRoZSBSQkMgSFcgb24gb2xk
ZXIgZmlybXdhcmUuIE5ld2VyIGZpcm13YXJlCnVzZXMgYSBTVyBSQkMgYW5kIHRoaXMgYml0IGhh
cyB0byBiZSBzZXQgYnkgdGhlIGRyaXZlci4KClNpZ25lZC1vZmYtYnk6IFRob25nIFRoYWkgPHRo
b25nLnRoYWlAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVf
dmNuLmggfCAgMSArCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS92Y25fdjJfMC5jICAgfCAx
MiArKysrKystLS0tLS0KIDIgZmlsZXMgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCA2IGRlbGV0
aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92
Y24uaCBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92Y24uaAppbmRleCA1ZTI0
NTNlZTZiMjkuLjRkM2JmNGFkZjFlYiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvYW1kZ3B1X3Zjbi5oCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdw
dV92Y24uaApAQCAtMzAsNiArMzAsNyBAQAogI2RlZmluZSBBTURHUFVfVkNOX0ZJUk1XQVJFX09G
RlNFVAkyNTYKICNkZWZpbmUgQU1ER1BVX1ZDTl9NQVhfRU5DX1JJTkdTCTMKIAorI2RlZmluZSBW
Q05fREVDX0tNRF9DTUQJCQkweDgwMDAwMDAwCiAjZGVmaW5lIFZDTl9ERUNfQ01EX0ZFTkNFCQkw
eDAwMDAwMDAwCiAjZGVmaW5lIFZDTl9ERUNfQ01EX1RSQVAJCTB4MDAwMDAwMDEKICNkZWZpbmUg
VkNOX0RFQ19DTURfV1JJVEVfUkVHCQkweDAwMDAwMDA0CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS92Y25fdjJfMC5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
dmNuX3YyXzAuYwppbmRleCBiYzk3MjY3ODdjOTcuLjcwOTFhZWY5NWZmMCAxMDA2NDQKLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvdmNuX3YyXzAuYworKysgYi9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS92Y25fdjJfMC5jCkBAIC0xNDg4LDcgKzE0ODgsNyBAQCBzdGF0aWMgdm9p
ZCB2Y25fdjJfMF9kZWNfcmluZ19pbnNlcnRfc3RhcnQoc3RydWN0IGFtZGdwdV9yaW5nICpyaW5n
KQogCWFtZGdwdV9yaW5nX3dyaXRlKHJpbmcsIFBBQ0tFVDAobW1VVkRfR1BDT01fVkNQVV9EQVRB
MF9JTlRFUk5BTF9PRkZTRVQsIDApKTsKIAlhbWRncHVfcmluZ193cml0ZShyaW5nLCAwKTsKIAlh
bWRncHVfcmluZ193cml0ZShyaW5nLCBQQUNLRVQwKG1tVVZEX0dQQ09NX1ZDUFVfQ01EX0lOVEVS
TkFMX09GRlNFVCwgMCkpOwotCWFtZGdwdV9yaW5nX3dyaXRlKHJpbmcsIFZDTl9ERUNfQ01EX1BB
Q0tFVF9TVEFSVCA8PCAxKTsKKwlhbWRncHVfcmluZ193cml0ZShyaW5nLCBWQ05fREVDX0tNRF9D
TUQgfCAoVkNOX0RFQ19DTURfUEFDS0VUX1NUQVJUIDw8IDEpKTsKIH0KIAogLyoqCkBAIC0xNTAx
LDcgKzE1MDEsNyBAQCBzdGF0aWMgdm9pZCB2Y25fdjJfMF9kZWNfcmluZ19pbnNlcnRfc3RhcnQo
c3RydWN0IGFtZGdwdV9yaW5nICpyaW5nKQogc3RhdGljIHZvaWQgdmNuX3YyXzBfZGVjX3Jpbmdf
aW5zZXJ0X2VuZChzdHJ1Y3QgYW1kZ3B1X3JpbmcgKnJpbmcpCiB7CiAJYW1kZ3B1X3Jpbmdfd3Jp
dGUocmluZywgUEFDS0VUMChtbVVWRF9HUENPTV9WQ1BVX0NNRF9JTlRFUk5BTF9PRkZTRVQsIDAp
KTsKLQlhbWRncHVfcmluZ193cml0ZShyaW5nLCBWQ05fREVDX0NNRF9QQUNLRVRfRU5EIDw8IDEp
OworCWFtZGdwdV9yaW5nX3dyaXRlKHJpbmcsIFZDTl9ERUNfS01EX0NNRCB8IChWQ05fREVDX0NN
RF9QQUNLRVRfRU5EIDw8IDEpKTsKIH0KIAogLyoqCkBAIC0xNTQ2LDcgKzE1NDYsNyBAQCBzdGF0
aWMgdm9pZCB2Y25fdjJfMF9kZWNfcmluZ19lbWl0X2ZlbmNlKHN0cnVjdCBhbWRncHVfcmluZyAq
cmluZywgdTY0IGFkZHIsIHU2NAogCWFtZGdwdV9yaW5nX3dyaXRlKHJpbmcsIHVwcGVyXzMyX2Jp
dHMoYWRkcikgJiAweGZmKTsKIAogCWFtZGdwdV9yaW5nX3dyaXRlKHJpbmcsIFBBQ0tFVDAobW1V
VkRfR1BDT01fVkNQVV9DTURfSU5URVJOQUxfT0ZGU0VULCAwKSk7Ci0JYW1kZ3B1X3Jpbmdfd3Jp
dGUocmluZywgVkNOX0RFQ19DTURfRkVOQ0UgPDwgMSk7CisJYW1kZ3B1X3Jpbmdfd3JpdGUocmlu
ZywgVkNOX0RFQ19LTURfQ01EIHwgKFZDTl9ERUNfQ01EX0ZFTkNFIDw8IDEpKTsKIAogCWFtZGdw
dV9yaW5nX3dyaXRlKHJpbmcsIFBBQ0tFVDAobW1VVkRfR1BDT01fVkNQVV9EQVRBMF9JTlRFUk5B
TF9PRkZTRVQsIDApKTsKIAlhbWRncHVfcmluZ193cml0ZShyaW5nLCAwKTsKQEAgLTE1NTYsNyAr
MTU1Niw3IEBAIHN0YXRpYyB2b2lkIHZjbl92Ml8wX2RlY19yaW5nX2VtaXRfZmVuY2Uoc3RydWN0
IGFtZGdwdV9yaW5nICpyaW5nLCB1NjQgYWRkciwgdTY0CiAKIAlhbWRncHVfcmluZ193cml0ZShy
aW5nLCBQQUNLRVQwKG1tVVZEX0dQQ09NX1ZDUFVfQ01EX0lOVEVSTkFMX09GRlNFVCwgMCkpOwog
Ci0JYW1kZ3B1X3Jpbmdfd3JpdGUocmluZywgVkNOX0RFQ19DTURfVFJBUCA8PCAxKTsKKwlhbWRn
cHVfcmluZ193cml0ZShyaW5nLCBWQ05fREVDX0tNRF9DTUQgfCAoVkNOX0RFQ19DTURfVFJBUCA8
PCAxKSk7CiB9CiAKIC8qKgpAQCAtMTYwMCw3ICsxNjAwLDcgQEAgc3RhdGljIHZvaWQgdmNuX3Yy
XzBfZGVjX3JpbmdfZW1pdF9yZWdfd2FpdChzdHJ1Y3QgYW1kZ3B1X3JpbmcgKnJpbmcsCiAKIAlh
bWRncHVfcmluZ193cml0ZShyaW5nLCBQQUNLRVQwKG1tVVZEX0dQQ09NX1ZDUFVfQ01EX0lOVEVS
TkFMX09GRlNFVCwgMCkpOwogCi0JYW1kZ3B1X3Jpbmdfd3JpdGUocmluZywgVkNOX0RFQ19DTURf
UkVHX1JFQURfQ09ORF9XQUlUIDw8IDEpOworCWFtZGdwdV9yaW5nX3dyaXRlKHJpbmcsIFZDTl9E
RUNfS01EX0NNRCB8IChWQ05fREVDX0NNRF9SRUdfUkVBRF9DT05EX1dBSVQgPDwgMSkpOwogfQog
CiBzdGF0aWMgdm9pZCB2Y25fdjJfMF9kZWNfcmluZ19lbWl0X3ZtX2ZsdXNoKHN0cnVjdCBhbWRn
cHVfcmluZyAqcmluZywKQEAgLTE2MjksNyArMTYyOSw3IEBAIHN0YXRpYyB2b2lkIHZjbl92Ml8w
X2RlY19yaW5nX2VtaXRfd3JlZyhzdHJ1Y3QgYW1kZ3B1X3JpbmcgKnJpbmcsCiAKIAlhbWRncHVf
cmluZ193cml0ZShyaW5nLCBQQUNLRVQwKG1tVVZEX0dQQ09NX1ZDUFVfQ01EX0lOVEVSTkFMX09G
RlNFVCwgMCkpOwogCi0JYW1kZ3B1X3Jpbmdfd3JpdGUocmluZywgVkNOX0RFQ19DTURfV1JJVEVf
UkVHIDw8IDEpOworCWFtZGdwdV9yaW5nX3dyaXRlKHJpbmcsIFZDTl9ERUNfS01EX0NNRCB8IChW
Q05fREVDX0NNRF9XUklURV9SRUcgPDwgMSkpOwogfQogCiAvKioKLS0gCjIuMTcuMQoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5n
IGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
