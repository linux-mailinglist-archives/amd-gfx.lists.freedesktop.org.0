Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 12424B599
	for <lists+amd-gfx@lfdr.de>; Sun, 28 Apr 2019 09:44:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90CAB89179;
	Sun, 28 Apr 2019 07:44:16 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr810043.outbound.protection.outlook.com [40.107.81.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7415489143
 for <amd-gfx@lists.freedesktop.org>; Sun, 28 Apr 2019 07:44:14 +0000 (UTC)
Received: from BYAPR12MB3176.namprd12.prod.outlook.com (20.179.92.82) by
 BYAPR12MB2933.namprd12.prod.outlook.com (20.179.91.202) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1835.12; Sun, 28 Apr 2019 07:44:13 +0000
Received: from BYAPR12MB3176.namprd12.prod.outlook.com
 ([fe80::9118:73f2:809c:22c7]) by BYAPR12MB3176.namprd12.prod.outlook.com
 ([fe80::9118:73f2:809c:22c7%4]) with mapi id 15.20.1835.010; Sun, 28 Apr 2019
 07:44:13 +0000
From: "Kuehling, Felix" <Felix.Kuehling@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 13/27] drm/amdkfd: Move sdma_queue_id calculation into
 allocate_sdma_queue()
Thread-Topic: [PATCH 13/27] drm/amdkfd: Move sdma_queue_id calculation into
 allocate_sdma_queue()
Thread-Index: AQHU/ZYruHrdAoJ9dEqFMZE2SwBKsg==
Date: Sun, 28 Apr 2019 07:44:12 +0000
Message-ID: <20190428074331.30107-14-Felix.Kuehling@amd.com>
References: <20190428074331.30107-1-Felix.Kuehling@amd.com>
In-Reply-To: <20190428074331.30107-1-Felix.Kuehling@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
x-mailer: git-send-email 2.17.1
x-clientproxiedby: YTXPR0101CA0015.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::28) To BYAPR12MB3176.namprd12.prod.outlook.com
 (2603:10b6:a03:133::18)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 60b3f120-bf11-4a47-6331-08d6cbad4e38
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:BYAPR12MB2933; 
x-ms-traffictypediagnostic: BYAPR12MB2933:
x-microsoft-antispam-prvs: <BYAPR12MB2933670A81F16E9CB0BBCB0292380@BYAPR12MB2933.namprd12.prod.outlook.com>
x-forefront-prvs: 0021920B5A
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(39860400002)(396003)(136003)(346002)(376002)(366004)(199004)(189003)(50226002)(81156014)(76176011)(54906003)(6512007)(4326008)(81166006)(8676002)(2616005)(3846002)(97736004)(186003)(8936002)(6116002)(6506007)(86362001)(36756003)(305945005)(6486002)(6436002)(7736002)(386003)(5640700003)(25786009)(11346002)(26005)(6916009)(1076003)(99286004)(256004)(5660300002)(2351001)(486006)(52116002)(2906002)(73956011)(71200400001)(2501003)(14454004)(53936002)(71190400001)(66476007)(66556008)(68736007)(66066001)(476003)(316002)(72206003)(102836004)(478600001)(64756008)(66946007)(66446008)(446003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR12MB2933;
 H:BYAPR12MB3176.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: g745ju1cB6BnucEORCaz1PkeiRTdrzzVabmTfub+LrYS+DRubC1H/u6QFROZdkA9/OlynKnnsfcyyjvU6dciELMYptWkdgN/akD+7QGNBbcQ7AH1SWPaDd/68VCX5xboSebtSUFoq+jXMsHK/p6xabUkOiurZtEusbLjnfjCCzYFz6pHd5fLsbyaq2VK5E758AZ/Zx2v3RUY82fUnSMBZKrTLEw2/GV51B1njW0u74BdegK18m5Eillm9GnFPmDVJbNSNvrltHUWLkfKZlEx8pOQ92RTNLKIDt8Y8ZS359RPkAZTzxCsobATEKP504P7of+Ueg583uSWhJMFZ3TysErs3SoLkINSxL2bcnSagn+431IcJilIxdkCQOsYlMtGYftMqIkmX5+1WXpKBsMoVobqyA2FGauNBCbTi02rr/c=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 60b3f120-bf11-4a47-6331-08d6cbad4e38
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Apr 2019 07:44:12.4735 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2933
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amd-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PBtp2g+a2gIdTQOTYyfIzhvkvomExoRBda70oDTKo0E=;
 b=Q9B7Ku7G/v0Fd3Oh6pgOzr94E0h53TGUsKmPJ6YmjI83gD4+h63pQAaq9GlqyNceUFV22pK2JfKkhct4eQrYSJ7Y2sDD9eOY5f9JOx7SAcfPJ7FSkfOq3CUyEGr28TINt66zobI4aGk2tqPtKlw8fd+iniilC3vuqU1FVUHM2+o=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Felix.Kuehling@amd.com; 
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
Cc: "Zhao, Yong" <Yong.Zhao@amd.com>, "Kuehling,
 Felix" <Felix.Kuehling@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogWW9uZyBaaGFvIDxZb25nLlpoYW9AYW1kLmNvbT4NCg0KVGhpcyBhdm9pZHMgZHVwbGlj
YXRlZCBjb2RlLg0KDQpTaWduZWQtb2ZmLWJ5OiBZb25nIFpoYW8gPFlvbmcuWmhhb0BhbWQuY29t
Pg0KUmV2aWV3ZWQtYnk6IEZlbGl4IEt1ZWhsaW5nIDxGZWxpeC5LdWVobGluZ0BhbWQuY29tPg0K
U2lnbmVkLW9mZi1ieTogRmVsaXggS3VlaGxpbmcgPEZlbGl4Lkt1ZWhsaW5nQGFtZC5jb20+DQot
LS0NCiAuLi4vZHJtL2FtZC9hbWRrZmQva2ZkX2RldmljZV9xdWV1ZV9tYW5hZ2VyLmMgfCAyOSAr
KysrKysrLS0tLS0tLS0tLS0tDQogMSBmaWxlIGNoYW5nZWQsIDExIGluc2VydGlvbnMoKyksIDE4
IGRlbGV0aW9ucygtKQ0KDQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQv
a2ZkX2RldmljZV9xdWV1ZV9tYW5hZ2VyLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9r
ZmRfZGV2aWNlX3F1ZXVlX21hbmFnZXIuYw0KaW5kZXggZTJkZTI0NmQ2ODFiLi4zOGM2NmI4ZmZk
MzEgMTAwNjQ0DQotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfZGV2aWNlX3F1
ZXVlX21hbmFnZXIuYw0KKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX2Rldmlj
ZV9xdWV1ZV9tYW5hZ2VyLmMNCkBAIC04ODMsNyArODgzLDcgQEAgc3RhdGljIGludCBzdG9wX25v
Y3BzY2goc3RydWN0IGRldmljZV9xdWV1ZV9tYW5hZ2VyICpkcW0pDQogfQ0KIA0KIHN0YXRpYyBp
bnQgYWxsb2NhdGVfc2RtYV9xdWV1ZShzdHJ1Y3QgZGV2aWNlX3F1ZXVlX21hbmFnZXIgKmRxbSwN
Ci0JCQkJdW5zaWduZWQgaW50ICpzZG1hX2lkKQ0KKwkJCQlzdHJ1Y3QgcXVldWUgKnEpDQogew0K
IAlpbnQgYml0Ow0KIA0KQEAgLTg5Miw3ICs4OTIsMTQgQEAgc3RhdGljIGludCBhbGxvY2F0ZV9z
ZG1hX3F1ZXVlKHN0cnVjdCBkZXZpY2VfcXVldWVfbWFuYWdlciAqZHFtLA0KIA0KIAliaXQgPSBf
X2ZmczY0KGRxbS0+c2RtYV9iaXRtYXApOw0KIAlkcW0tPnNkbWFfYml0bWFwICY9IH4oMVVMTCA8
PCBiaXQpOw0KLQkqc2RtYV9pZCA9IGJpdDsNCisJcS0+c2RtYV9pZCA9IGJpdDsNCisNCisJcS0+
cHJvcGVydGllcy5zZG1hX2VuZ2luZV9pZCA9IHEtPnNkbWFfaWQgJSBnZXRfbnVtX3NkbWFfZW5n
aW5lcyhkcW0pOw0KKwlxLT5wcm9wZXJ0aWVzLnNkbWFfcXVldWVfaWQgPSBxLT5zZG1hX2lkIC8g
Z2V0X251bV9zZG1hX2VuZ2luZXMoZHFtKTsNCisNCisJcHJfZGVidWcoIlNETUEgaWQgaXM6ICAg
ICVkXG4iLCBxLT5zZG1hX2lkKTsNCisJcHJfZGVidWcoIlNETUEgZW5naW5lIGlkOiAlZFxuIiwg
cS0+cHJvcGVydGllcy5zZG1hX2VuZ2luZV9pZCk7DQorCXByX2RlYnVnKCJTRE1BIHF1ZXVlIGlk
OiAlZFxuIiwgcS0+cHJvcGVydGllcy5zZG1hX3F1ZXVlX2lkKTsNCiANCiAJcmV0dXJuIDA7DQog
fQ0KQEAgLTkxNCwyMSArOTIxLDE0IEBAIHN0YXRpYyBpbnQgY3JlYXRlX3NkbWFfcXVldWVfbm9j
cHNjaChzdHJ1Y3QgZGV2aWNlX3F1ZXVlX21hbmFnZXIgKmRxbSwNCiANCiAJbXFkX21nciA9IGRx
bS0+bXFkX21ncnNbS0ZEX01RRF9UWVBFX1NETUFdOw0KIA0KLQlyZXR2YWwgPSBhbGxvY2F0ZV9z
ZG1hX3F1ZXVlKGRxbSwgJnEtPnNkbWFfaWQpOw0KKwlyZXR2YWwgPSBhbGxvY2F0ZV9zZG1hX3F1
ZXVlKGRxbSwgcSk7DQogCWlmIChyZXR2YWwpDQogCQlyZXR1cm4gcmV0dmFsOw0KIA0KLQlxLT5w
cm9wZXJ0aWVzLnNkbWFfcXVldWVfaWQgPSBxLT5zZG1hX2lkIC8gZ2V0X251bV9zZG1hX2VuZ2lu
ZXMoZHFtKTsNCi0JcS0+cHJvcGVydGllcy5zZG1hX2VuZ2luZV9pZCA9IHEtPnNkbWFfaWQgJSBn
ZXRfbnVtX3NkbWFfZW5naW5lcyhkcW0pOw0KLQ0KIAlyZXR2YWwgPSBhbGxvY2F0ZV9kb29yYmVs
bChxcGQsIHEpOw0KIAlpZiAocmV0dmFsKQ0KIAkJZ290byBvdXRfZGVhbGxvY2F0ZV9zZG1hX3F1
ZXVlOw0KIA0KLQlwcl9kZWJ1ZygiU0RNQSBpZCBpczogICAgJWRcbiIsIHEtPnNkbWFfaWQpOw0K
LQlwcl9kZWJ1ZygiU0RNQSBxdWV1ZSBpZDogJWRcbiIsIHEtPnByb3BlcnRpZXMuc2RtYV9xdWV1
ZV9pZCk7DQotCXByX2RlYnVnKCJTRE1BIGVuZ2luZSBpZDogJWRcbiIsIHEtPnByb3BlcnRpZXMu
c2RtYV9lbmdpbmVfaWQpOw0KLQ0KIAlkcW0tPmFzaWNfb3BzLmluaXRfc2RtYV92bShkcW0sIHEs
IHFwZCk7DQogCXJldHZhbCA9IG1xZF9tZ3ItPmluaXRfbXFkKG1xZF9tZ3IsICZxLT5tcWQsICZx
LT5tcWRfbWVtX29iaiwNCiAJCQkJJnEtPmdhcnRfbXFkX2FkZHIsICZxLT5wcm9wZXJ0aWVzKTsN
CkBAIC0xMTI5LDE2ICsxMTI5LDkgQEAgc3RhdGljIGludCBjcmVhdGVfcXVldWVfY3BzY2goc3Ry
dWN0IGRldmljZV9xdWV1ZV9tYW5hZ2VyICpkcW0sIHN0cnVjdCBxdWV1ZSAqcSwNCiAJfQ0KIA0K
IAlpZiAocS0+cHJvcGVydGllcy50eXBlID09IEtGRF9RVUVVRV9UWVBFX1NETUEpIHsNCi0JCXJl
dHZhbCA9IGFsbG9jYXRlX3NkbWFfcXVldWUoZHFtLCAmcS0+c2RtYV9pZCk7DQorCQlyZXR2YWwg
PSBhbGxvY2F0ZV9zZG1hX3F1ZXVlKGRxbSwgcSk7DQogCQlpZiAocmV0dmFsKQ0KIAkJCWdvdG8g
b3V0Ow0KLQkJcS0+cHJvcGVydGllcy5zZG1hX3F1ZXVlX2lkID0NCi0JCQlxLT5zZG1hX2lkIC8g
Z2V0X251bV9zZG1hX2VuZ2luZXMoZHFtKTsNCi0JCXEtPnByb3BlcnRpZXMuc2RtYV9lbmdpbmVf
aWQgPQ0KLQkJCXEtPnNkbWFfaWQgJSBnZXRfbnVtX3NkbWFfZW5naW5lcyhkcW0pOw0KLQkJcHJf
ZGVidWcoIlNETUEgaWQgaXM6ICAgICVkXG4iLCBxLT5zZG1hX2lkKTsNCi0JCXByX2RlYnVnKCJT
RE1BIHF1ZXVlIGlkOiAlZFxuIiwgcS0+cHJvcGVydGllcy5zZG1hX3F1ZXVlX2lkKTsNCi0JCXBy
X2RlYnVnKCJTRE1BIGVuZ2luZSBpZDogJWRcbiIsIHEtPnByb3BlcnRpZXMuc2RtYV9lbmdpbmVf
aWQpOw0KIAl9DQogDQogCXJldHZhbCA9IGFsbG9jYXRlX2Rvb3JiZWxsKHFwZCwgcSk7DQotLSAN
CjIuMTcuMQ0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
