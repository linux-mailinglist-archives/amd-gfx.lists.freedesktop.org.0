Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BD40258C3
	for <lists+amd-gfx@lfdr.de>; Tue, 21 May 2019 22:20:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AF3189415;
	Tue, 21 May 2019 20:20:55 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr820072.outbound.protection.outlook.com [40.107.82.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F31B7892C2
 for <amd-gfx@lists.freedesktop.org>; Tue, 21 May 2019 20:20:53 +0000 (UTC)
Received: from DM6PR12MB3947.namprd12.prod.outlook.com (10.255.174.156) by
 DM6PR12MB3833.namprd12.prod.outlook.com (10.255.173.138) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1900.17; Tue, 21 May 2019 20:20:52 +0000
Received: from DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::2916:eda4:a1fd:fd36]) by DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::2916:eda4:a1fd:fd36%3]) with mapi id 15.20.1922.013; Tue, 21 May 2019
 20:20:52 +0000
From: "Kuehling, Felix" <Felix.Kuehling@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 6/7] drm/amdkfd: New IOCTL to allocate queue GWS
Thread-Topic: [PATCH 6/7] drm/amdkfd: New IOCTL to allocate queue GWS
Thread-Index: AQHVC14Y1CegKp3Ftkucdi7gp0UiRaZ2DqAA
Date: Tue, 21 May 2019 20:20:52 +0000
Message-ID: <79e84499-d858-2092-639d-48d255ccb79e@amd.com>
References: <1557952664-12218-1-git-send-email-Oak.Zeng@amd.com>
 <1557952664-12218-6-git-send-email-Oak.Zeng@amd.com>
In-Reply-To: <1557952664-12218-6-git-send-email-Oak.Zeng@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
x-clientproxiedby: YTXPR0101CA0050.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:1::27) To DM6PR12MB3947.namprd12.prod.outlook.com
 (2603:10b6:5:1cb::28)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ba286970-329c-4670-5957-08d6de29d203
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:DM6PR12MB3833; 
x-ms-traffictypediagnostic: DM6PR12MB3833:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <DM6PR12MB383377D81BA4382ED1549EBF92070@DM6PR12MB3833.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-forefront-prvs: 0044C17179
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(346002)(396003)(39860400002)(136003)(376002)(366004)(199004)(189003)(65826007)(5640700003)(6436002)(6486002)(66066001)(65806001)(65956001)(68736007)(6916009)(229853002)(53546011)(6506007)(386003)(102836004)(31696002)(52116002)(2501003)(58126008)(14454004)(966005)(3846002)(64126003)(6116002)(478600001)(6512007)(25786009)(5660300002)(73956011)(66446008)(64756008)(66556008)(66476007)(76176011)(72206003)(86362001)(99286004)(8936002)(2351001)(6246003)(81166006)(26005)(8676002)(446003)(2906002)(11346002)(186003)(316002)(53936002)(6306002)(81156014)(256004)(14444005)(71190400001)(71200400001)(486006)(7736002)(31686004)(66946007)(36756003)(305945005)(476003)(2616005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3833;
 H:DM6PR12MB3947.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: fQI7m/t4R+oYrs4vljNJnNgmrZyAe7CVTlJeAy+JfUxBdg58MuY4g+vbw3msvJU2K9G+idAYP/CZRWLmaV3ipjCKVPKYE5PSbRyKI6VRzaDx95FHbHavL5S5i0/OI727Gow5FbbL8n4xTaq7tF1A6Uw2iQA6MuIEY2KbpXOTdUbe61Z328mUpTYT7oUfbgWK0wW4UwjYh5xLc9F2Xuy2g0lGdWFCWvPIe4q08Z/YB8wisXGgHZxE87bnvt9Pl1qStYxskFIZRfr4RovOgC5TFrOktxC3JwB3BQX96J/i39MG+4krjtnzjsu8p6Xnausbdq9t1qtWYzXaOB5lw/7zBIQlCT2fXqmyGILcWMJxzdZBFUlsvXlZ8cxisBzP23L1AR7qIN2wPckKKSFQSO+7sksYSgFLXpZmoFxziAzU58E=
Content-ID: <DAC0AC4E20D66543B4C15CCF26A935D0@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba286970-329c-4670-5957-08d6de29d203
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 May 2019 20:20:52.0686 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3833
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kCOr/GJBXsB+qBXzzcvKGXyrL7aTbdCI+cCkMqBrwYU=;
 b=143/hynAydzgSwtZ1IlR0qG/ISd3eG6U9uddV4Nq01DMbV/DrhP0vTtH1Pk7MG2UkAFGoLszZCOB9ia7rWuGmrVgvZm2RGlJGZeBAbcv9/bd1khi+f6DxMPOjkgdaUv0SWsRAE9RgBW346Z6ploO3y3fiU6zPhYQ84JuQmKewPw=
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gMjAxOS0wNS0xNSA0OjM3IHAubS4sIFplbmcsIE9hayB3cm90ZToNCj4gW0NBVVRJT046IEV4
dGVybmFsIEVtYWlsXQ0KPg0KPiBBZGQgYSBuZXcga2ZkIGlvY3RsIHRvIGFsbG9jYXRlIHF1ZXVl
IEdXUy4gUXVldWUNCj4gR1dTIGlzIHJlbGVhc2VkIG9uIHF1ZXVlIGRlc3Ryb3kuDQo+DQo+IENo
YW5nZS1JZDogSTYwMTUzYzI2YTU3Nzk5MmFkODczZTQyOTJlNzU5ZTVjM2Q1YmJkMTUNCj4gU2ln
bmVkLW9mZi1ieTogT2FrIFplbmcgPE9hay5aZW5nQGFtZC5jb20+DQo+IC0tLQ0KPiAgIGRyaXZl
cnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9jaGFyZGV2LmMgICAgICAgICAgIHwgMzkgKysrKysr
KysrKysrKysrKysrKysrKw0KPiAgIC4uLi9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX3Byb2Nlc3Nf
cXVldWVfbWFuYWdlci5jIHwgIDYgKysrKw0KPiAgIGluY2x1ZGUvdWFwaS9saW51eC9rZmRfaW9j
dGwuaCAgICAgICAgICAgICAgICAgICAgIHwgMjAgKysrKysrKysrKy0NCj4gICAzIGZpbGVzIGNo
YW5nZWQsIDY0IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCj4NCj4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9jaGFyZGV2LmMgYi9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGtmZC9rZmRfY2hhcmRldi5jDQo+IGluZGV4IDM4YWU1M2YuLjgyOGJkNjYgMTAw
NjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9jaGFyZGV2LmMNCj4g
KysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX2NoYXJkZXYuYw0KPiBAQCAtMTU1
OSw2ICsxNTU5LDQzIEBAIHN0YXRpYyBpbnQga2ZkX2lvY3RsX3VubWFwX21lbW9yeV9mcm9tX2dw
dShzdHJ1Y3QgZmlsZSAqZmlsZXAsDQo+ICAgICAgICAgIHJldHVybiBlcnI7DQo+ICAgfQ0KPg0K
PiArc3RhdGljIGludCBrZmRfaW9jdGxfYWxsb2NfcXVldWVfZ3dzKHN0cnVjdCBmaWxlICpmaWxl
cCwNCj4gKyAgICAgICAgICAgICAgIHN0cnVjdCBrZmRfcHJvY2VzcyAqcCwgdm9pZCAqZGF0YSkN
Cj4gK3sNCj4gKyAgICAgICBpbnQgcmV0dmFsOw0KPiArICAgICAgIHN0cnVjdCBrZmRfaW9jdGxf
YWxsb2NfcXVldWVfZ3dzX2FyZ3MgKmFyZ3MgPSBkYXRhOw0KPiArICAgICAgIHN0cnVjdCBrZmRf
ZGV2ICpkZXYgPSBOVUxMOw0KPiArICAgICAgIHN0cnVjdCBrZ2RfbWVtICptZW07DQo+ICsNCj4g
KyAgICAgICBpZiAoYXJncy0+bnVtX2d3cyA9PSAwKQ0KPiArICAgICAgICAgICAgICAgcmV0dXJu
IC1FSU5WQUw7DQo+ICsNCj4gKyAgICAgICBpZiAoIWh3c19nd3Nfc3VwcG9ydCB8fA0KPiArICAg
ICAgICAgICAgICAgZGV2LT5kcW0tPnNjaGVkX3BvbGljeSA9PSBLRkRfU0NIRURfUE9MSUNZX05P
X0hXUykNCj4gKyAgICAgICAgICAgICAgIHJldHVybiAtRUlOVkFMOw0KPiArDQo+ICsgICAgICAg
ZGV2ID0ga2ZkX2RldmljZV9ieV9pZChhcmdzLT5ncHVfaWQpOw0KPiArICAgICAgIGlmICghZGV2
KSB7DQo+ICsgICAgICAgICAgICAgICBwcl9kZWJ1ZygiQ291bGQgbm90IGZpbmQgZ3B1IGlkIDB4
JXhcbiIsIGFyZ3MtPmdwdV9pZCk7DQo+ICsgICAgICAgICAgICAgICByZXR1cm4gLUVJTlZBTDsN
Cj4gKyAgICAgICB9DQo+ICsNCj4gKyAgICAgICByZXR2YWwgPSBhbWRncHVfYW1ka2ZkX2FkZF9n
d3NfdG9fcHJvY2VzcyhwLT5rZ2RfcHJvY2Vzc19pbmZvLA0KPiArICAgICAgICAgICAgICAgICAg
ICAgICBkZXYtPmd3cywgJm1lbSk7DQo+ICsgICAgICAgaWYgKHVubGlrZWx5KHJldHZhbCkpDQo+
ICsgICAgICAgICAgICAgICByZXR1cm4gcmV0dmFsOw0KPiArDQo+ICsgICAgICAgbXV0ZXhfbG9j
aygmcC0+bXV0ZXgpOw0KPiArICAgICAgIHJldHZhbCA9IHBxbV9zZXRfZ3dzKCZwLT5wcW0sIGFy
Z3MtPnF1ZXVlX2lkLCBtZW0pOw0KPiArICAgICAgIG11dGV4X3VubG9jaygmcC0+bXV0ZXgpOw0K
PiArDQo+ICsgICAgICAgaWYgKHVubGlrZWx5KHJldHZhbCkpDQo+ICsgICAgICAgICAgICAgICBh
bWRncHVfYW1ka2ZkX3JlbW92ZV9nd3NfZnJvbV9wcm9jZXNzKHAtPmtnZF9wcm9jZXNzX2luZm8s
IG1lbSk7DQo+ICsNCj4gKyAgICAgICBhcmdzLT5maXJzdF9nd3MgPSAwOw0KPiArICAgICAgIHJl
dHVybiByZXR2YWw7DQo+ICt9DQo+ICsNCj4gICBzdGF0aWMgaW50IGtmZF9pb2N0bF9nZXRfZG1h
YnVmX2luZm8oc3RydWN0IGZpbGUgKmZpbGVwLA0KPiAgICAgICAgICAgICAgICAgIHN0cnVjdCBr
ZmRfcHJvY2VzcyAqcCwgdm9pZCAqZGF0YSkNCj4gICB7DQo+IEBAIC0xNzYxLDYgKzE3OTgsOCBA
QCBzdGF0aWMgY29uc3Qgc3RydWN0IGFtZGtmZF9pb2N0bF9kZXNjIGFtZGtmZF9pb2N0bHNbXSA9
IHsNCj4gICAgICAgICAgQU1ES0ZEX0lPQ1RMX0RFRihBTURLRkRfSU9DX0lNUE9SVF9ETUFCVUYs
DQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGtmZF9pb2N0bF9pbXBvcnRfZG1h
YnVmLCAwKSwNCj4NCj4gKyAgICAgICBBTURLRkRfSU9DVExfREVGKEFNREtGRF9JT0NfQUxMT0Nf
UVVFVUVfR1dTLA0KPiArICAgICAgICAgICAgICAgICAgICAgICBrZmRfaW9jdGxfYWxsb2NfcXVl
dWVfZ3dzLCAwKSwNCj4gICB9Ow0KPg0KPiAgICNkZWZpbmUgQU1ES0ZEX0NPUkVfSU9DVExfQ09V
TlQgICAgICAgIEFSUkFZX1NJWkUoYW1ka2ZkX2lvY3RscykNCj4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9wcm9jZXNzX3F1ZXVlX21hbmFnZXIuYyBiL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9wcm9jZXNzX3F1ZXVlX21hbmFnZXIuYw0KPiBpbmRl
eCA4ZTQ1Mjk2Li5lMTVhZDQ4IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGtmZC9rZmRfcHJvY2Vzc19xdWV1ZV9tYW5hZ2VyLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRrZmQva2ZkX3Byb2Nlc3NfcXVldWVfbWFuYWdlci5jDQo+IEBAIC0zNjMsNiArMzYz
LDEyIEBAIGludCBwcW1fZGVzdHJveV9xdWV1ZShzdHJ1Y3QgcHJvY2Vzc19xdWV1ZV9tYW5hZ2Vy
ICpwcW0sIHVuc2lnbmVkIGludCBxaWQpDQo+ICAgICAgICAgICAgICAgICAgcmV0dXJuIC0xOw0K
PiAgICAgICAgICB9DQo+DQo+ICsgICAgICAgaWYgKHBxbV9nZXRfZ3dzKHBxbSwgcWlkKSkgew0K
PiArICAgICAgICAgICAgICAgYW1kZ3B1X2FtZGtmZF9yZW1vdmVfZ3dzX2Zyb21fcHJvY2Vzcyhw
cW0tPnByb2Nlc3MtPmtnZF9wcm9jZXNzX2luZm8sDQo+ICsgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgcHFtX2dldF9nd3MocHFtLCBxaWQpKTsNCj4gKyAgICAgICAgICAgICAgIHBxbV9z
ZXRfZ3dzKHBxbSwgcWlkLCBOVUxMKTsNCj4gKyAgICAgICB9DQo+ICsNCj4gICAgICAgICAgaWYg
KHBxbi0+a3EpIHsNCj4gICAgICAgICAgICAgICAgICAvKiBkZXN0cm95IGtlcm5lbCBxdWV1ZSAo
RElRKSAqLw0KPiAgICAgICAgICAgICAgICAgIGRxbSA9IHBxbi0+a3EtPmRldi0+ZHFtOw0KPiBk
aWZmIC0tZ2l0IGEvaW5jbHVkZS91YXBpL2xpbnV4L2tmZF9pb2N0bC5oIGIvaW5jbHVkZS91YXBp
L2xpbnV4L2tmZF9pb2N0bC5oDQo+IGluZGV4IDIwOTE3YzUuLjkxMmQ2OTAgMTAwNjQ0DQo+IC0t
LSBhL2luY2x1ZGUvdWFwaS9saW51eC9rZmRfaW9jdGwuaA0KPiArKysgYi9pbmNsdWRlL3VhcGkv
bGludXgva2ZkX2lvY3RsLmgNCj4gQEAgLTQxMCw2ICs0MTAsMjEgQEAgc3RydWN0IGtmZF9pb2N0
bF91bm1hcF9tZW1vcnlfZnJvbV9ncHVfYXJncyB7DQo+ICAgICAgICAgIF9fdTMyIG5fc3VjY2Vz
czsgICAgICAgICAgICAgICAgLyogdG8vZnJvbSBLRkQgKi8NCj4gICB9Ow0KPg0KPiArLyogQWxs
b2NhdGUgR1dTIGZvciBzcGVjaWZpYyBxdWV1ZQ0KPiArICoNCj4gKyAqIEBncHVfaWQ6ICAgICAg
ZGV2aWNlIGlkZW50aWZpZXINCj4gKyAqIEBxdWV1ZV9pZDogICAgcXVldWUncyBpZCB0aGF0IEdX
UyBpcyBhbGxvY2F0ZWQgZm9yDQo+ICsgKiBAbnVtX2d3czogICAgIGhvdyBtYW55IEdXUyB0byBh
bGxvY2F0ZQ0KPiArICogQGZpcnN0X2d3czogICBpbmRleCBvZiB0aGUgZmlyc3QgR1dTIGFsbG9j
YXRlZC4NCj4gKyAqICAgICAgICAgICAgICAgb25seSBzdXBwb3J0IGNvbnRpZ3VvdXMgR1dTIGFs
bG9jYXRpb24NCj4gKyAqLw0KPiArc3RydWN0IGtmZF9pb2N0bF9hbGxvY19xdWV1ZV9nd3NfYXJn
cyB7DQo+ICsgICAgICAgX191MzIgZ3B1X2lkOyAgICAgICAgICAgLyogdG8gS0ZEICovDQo+ICsg
ICAgICAgX191MzIgcXVldWVfaWQ7ICAgICAgICAgLyogdG8gS0ZEICovDQo+ICsgICAgICAgX191
MzIgbnVtX2d3czsgICAgICAgICAgLyogdG8gS0ZEICovDQo+ICsgICAgICAgX191MzIgZmlyc3Rf
Z3dzOyAgICAgICAgLyogZnJvbSBLRkQgKi8NCj4gK307DQo+ICsNCj4gICBzdHJ1Y3Qga2ZkX2lv
Y3RsX2dldF9kbWFidWZfaW5mb19hcmdzIHsNCj4gICAgICAgICAgX191NjQgc2l6ZTsgICAgICAg
ICAgICAgLyogZnJvbSBLRkQgKi8NCj4gICAgICAgICAgX191NjQgbWV0YWRhdGFfcHRyOyAgICAg
LyogdG8gS0ZEICovDQo+IEBAIC01MjksNyArNTQ0LDEwIEBAIGVudW0ga2ZkX21taW9fcmVtYXAg
ew0KPiAgICNkZWZpbmUgQU1ES0ZEX0lPQ19JTVBPUlRfRE1BQlVGICAgICAgICAgICAgICAgXA0K
PiAgICAgICAgICAgICAgICAgIEFNREtGRF9JT1dSKDB4MUQsIHN0cnVjdCBrZmRfaW9jdGxfaW1w
b3J0X2RtYWJ1Zl9hcmdzKQ0KPg0KPiArI2RlZmluZSBBTURLRkRfSU9DX0FMTE9DX1FVRVVFX0dX
UyAgICAgICAgICAgICBcDQo+ICsgICAgICAgICAgICAgICBBTURLRkRfSU9XUigweDIyLCBzdHJ1
Y3Qga2ZkX2lvY3RsX2FsbG9jX3F1ZXVlX2d3c19hcmdzKQ0KPiArDQoNClRoaXMgaGFzIHRvIGJl
IDB4MUUgZm9yIHVwc3RyZWFtLiBXaGVuIHdlIG1lcmdlIHRoaXMgYmFjayBpbnRvIA0KYW1kLWtm
ZC1zdGFnaW5nLCB3ZSdsbCBoYXZlIHRvIG1vdmUgdGhlIG90aGVyIG5vbi11cHN0cmVhbSBpb2N0
bCBudW1iZXJzLg0KDQoNCj4gICAjZGVmaW5lIEFNREtGRF9DT01NQU5EX1NUQVJUICAgICAgICAg
ICAweDAxDQo+IC0jZGVmaW5lIEFNREtGRF9DT01NQU5EX0VORCAgICAgICAgICAgICAweDFFDQo+
ICsjZGVmaW5lIEFNREtGRF9DT01NQU5EX0VORCAgICAgICAgICAgICAweDIzDQoNCjB4MUYNCg0K
UmVnYXJkcywNCiDCoCBGZWxpeA0KDQo+DQo+ICAgI2VuZGlmDQo+IC0tDQo+IDIuNy40DQo+DQo+
IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fDQo+IGFtZC1n
ZnggbWFpbGluZyBsaXN0DQo+IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+IGh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA0KX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5n
IGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
