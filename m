Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD4FB271E7
	for <lists+amd-gfx@lfdr.de>; Wed, 22 May 2019 23:49:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CECD989C6C;
	Wed, 22 May 2019 21:49:25 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr740081.outbound.protection.outlook.com [40.107.74.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3FE789C6C
 for <amd-gfx@lists.freedesktop.org>; Wed, 22 May 2019 21:49:23 +0000 (UTC)
Received: from DM6PR12MB3947.namprd12.prod.outlook.com (10.255.174.156) by
 DM6PR12MB2908.namprd12.prod.outlook.com (20.179.71.214) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1900.17; Wed, 22 May 2019 21:49:22 +0000
Received: from DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::2916:eda4:a1fd:fd36]) by DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::2916:eda4:a1fd:fd36%3]) with mapi id 15.20.1922.013; Wed, 22 May 2019
 21:49:22 +0000
From: "Kuehling, Felix" <Felix.Kuehling@amd.com>
To: "Zeng, Oak" <Oak.Zeng@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 6/7] drm/amdkfd: New IOCTL to allocate queue GWS
Thread-Topic: [PATCH 6/7] drm/amdkfd: New IOCTL to allocate queue GWS
Thread-Index: AQHVELZAbcwxp1FOP0WKg3xa/dfYp6Z3rv8A
Date: Wed, 22 May 2019 21:49:21 +0000
Message-ID: <37883f89-b2a0-4d3f-76d8-eb3cf8b9a462@amd.com>
References: <1558540278-23734-1-git-send-email-Oak.Zeng@amd.com>
 <1558540278-23734-6-git-send-email-Oak.Zeng@amd.com>
In-Reply-To: <1558540278-23734-6-git-send-email-Oak.Zeng@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
x-clientproxiedby: YTOPR0101CA0014.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::27) To DM6PR12MB3947.namprd12.prod.outlook.com
 (2603:10b6:5:1cb::28)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6de25082-ca29-400b-fc5d-08d6deff593f
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:DM6PR12MB2908; 
x-ms-traffictypediagnostic: DM6PR12MB2908:
x-microsoft-antispam-prvs: <DM6PR12MB2908EA21A93EB4F0518F119292000@DM6PR12MB2908.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1443;
x-forefront-prvs: 0045236D47
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(39860400002)(366004)(346002)(396003)(136003)(376002)(189003)(199004)(71200400001)(99286004)(186003)(76176011)(71190400001)(316002)(36756003)(52116002)(14444005)(486006)(256004)(31686004)(26005)(72206003)(14454004)(102836004)(2616005)(11346002)(446003)(65956001)(65806001)(6512007)(66066001)(386003)(53546011)(6506007)(476003)(86362001)(31696002)(68736007)(478600001)(7736002)(305945005)(25786009)(6436002)(66946007)(73956011)(6486002)(4326008)(3846002)(6116002)(229853002)(6246003)(53936002)(65826007)(2501003)(110136005)(66476007)(2906002)(66556008)(64756008)(5660300002)(58126008)(8936002)(81166006)(81156014)(66446008)(64126003)(8676002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB2908;
 H:DM6PR12MB3947.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: LMM6unmcs4NQIgE3W7rATFCqALnk2QQqxGw3jIwm9wfhUl0sZsV0F89rZRnNSx2emJ6Af2Dct+bE0lvzrXcE3DYcr1Nug81xLxS0FcuqK9Fg9XFalPr7yozrISBsNK9cse48SyQ3F7hUFT45NIeMSGj9BdX26DJTpWcKYVRoeNtV83mXqlALfswmkMLr9ioM5D+r9UatH3y/RgRvkBRgs7bE5Fn5DYA//vf0D6WoTku51dv/kBBMIFKEto29qGXAADxOl31Yg7s6FWLxV/6llB8/ADEnLdJpr0V1HU1IVhzztrQ5P42aZUUg21QE4qL4Q/E13tPk4wGKW4EMlN4fY3u9vTNHm7EMw3QRBX/L73QhjUEq0ba0h27/jk1YzJsALvmibBP4qMcmxHHcjT2dOUlROzZ7wHJrpKXGv5D/yro=
Content-ID: <53D16D4AAC226C40A2B03230E4E11CEB@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6de25082-ca29-400b-fc5d-08d6deff593f
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 May 2019 21:49:21.7638 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2908
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NikCBslrDLj5BZIygOEXLb0Tr2dC4vnef0caKZy1YIg=;
 b=XfFwFzwoRqmoRPguND/lqjxmxUrXJygzbtRlS3uK0ChdJmUkQJFl4stGstOLA5DDPZGOiUaiu7Nlp9W6DZxcZnqsXYAz5zIustzh/JlhmcwBKDEbVCZuZPJQpdmCsO4PS9VB/g2kESSr99bgDE8tJlvWah91nZrqAlD9vZpGuOY=
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
Cc: "Keely, Sean" <Sean.Keely@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gMjAxOS0wNS0yMiAxMTo1MSBhLm0uLCBaZW5nLCBPYWsgd3JvdGU6DQo+IEFkZCBhIG5ldyBr
ZmQgaW9jdGwgdG8gYWxsb2NhdGUgcXVldWUgR1dTLiBRdWV1ZQ0KPiBHV1MgaXMgcmVsZWFzZWQg
b24gcXVldWUgZGVzdHJveS4NCj4NCj4gQ2hhbmdlLUlkOiBJNjAxNTNjMjZhNTc3OTkyYWQ4NzNl
NDI5MmU3NTllNWMzZDViYmQxNQ0KPiBTaWduZWQtb2ZmLWJ5OiBPYWsgWmVuZyA8T2FrLlplbmdA
YW1kLmNvbT4NCj4gLS0tDQo+ICAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX2NoYXJk
ZXYuYyB8IDM5ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrDQo+ICAgaW5jbHVkZS91
YXBpL2xpbnV4L2tmZF9pb2N0bC5oICAgICAgICAgICB8IDIwICsrKysrKysrKysrKysrKy0NCj4g
ICAyIGZpbGVzIGNoYW5nZWQsIDU4IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCj4NCj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9jaGFyZGV2LmMgYi9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfY2hhcmRldi5jDQo+IGluZGV4IDM4YWU1M2Yu
LjgyOGJkNjYgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9j
aGFyZGV2LmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX2NoYXJkZXYu
Yw0KPiBAQCAtMTU1OSw2ICsxNTU5LDQzIEBAIHN0YXRpYyBpbnQga2ZkX2lvY3RsX3VubWFwX21l
bW9yeV9mcm9tX2dwdShzdHJ1Y3QgZmlsZSAqZmlsZXAsDQo+ICAgCXJldHVybiBlcnI7DQo+ICAg
fQ0KPiAgIA0KPiArc3RhdGljIGludCBrZmRfaW9jdGxfYWxsb2NfcXVldWVfZ3dzKHN0cnVjdCBm
aWxlICpmaWxlcCwNCj4gKwkJc3RydWN0IGtmZF9wcm9jZXNzICpwLCB2b2lkICpkYXRhKQ0KPiAr
ew0KPiArCWludCByZXR2YWw7DQo+ICsJc3RydWN0IGtmZF9pb2N0bF9hbGxvY19xdWV1ZV9nd3Nf
YXJncyAqYXJncyA9IGRhdGE7DQo+ICsJc3RydWN0IGtmZF9kZXYgKmRldiA9IE5VTEw7DQo+ICsJ
c3RydWN0IGtnZF9tZW0gKm1lbTsNCj4gKw0KPiArCWlmIChhcmdzLT5udW1fZ3dzID09IDApDQo+
ICsJCXJldHVybiAtRUlOVkFMOw0KPiArDQo+ICsJaWYgKCFod3NfZ3dzX3N1cHBvcnQgfHwNCj4g
KwkJZGV2LT5kcW0tPnNjaGVkX3BvbGljeSA9PSBLRkRfU0NIRURfUE9MSUNZX05PX0hXUykNCj4g
KwkJcmV0dXJuIC1FSU5WQUw7DQo+ICsNCj4gKwlkZXYgPSBrZmRfZGV2aWNlX2J5X2lkKGFyZ3Mt
PmdwdV9pZCk7DQo+ICsJaWYgKCFkZXYpIHsNCj4gKwkJcHJfZGVidWcoIkNvdWxkIG5vdCBmaW5k
IGdwdSBpZCAweCV4XG4iLCBhcmdzLT5ncHVfaWQpOw0KPiArCQlyZXR1cm4gLUVJTlZBTDsNCj4g
Kwl9DQo+ICsNCj4gKwlyZXR2YWwgPSBhbWRncHVfYW1ka2ZkX2FkZF9nd3NfdG9fcHJvY2Vzcyhw
LT5rZ2RfcHJvY2Vzc19pbmZvLA0KPiArCQkJZGV2LT5nd3MsICZtZW0pOw0KDQpEbyB5b3Ugd2Fu
dCB0byBtb3ZlIHRoaXMgaW50byBwcW1fc2V0X2d3cz8gVGhlIGNvcnJlc3BvbmRpbmcgY2FsbCB0
byANCmFtZGdwdV9hbWRrZmRfcmVtb3ZlX2Zyb21fZ3dzIGlzIGhhbmRsZWQgaW4gcHFtIChkdXJp
bmcgcXVldWUgDQpkZXN0cnVjdGlvbikgdG9vLg0KDQpSZWdhcmRzLA0KIMKgIEZlbGl4DQoNCg0K
PiArCWlmICh1bmxpa2VseShyZXR2YWwpKQ0KPiArCQlyZXR1cm4gcmV0dmFsOw0KPiArDQo+ICsJ
bXV0ZXhfbG9jaygmcC0+bXV0ZXgpOw0KPiArCXJldHZhbCA9IHBxbV9zZXRfZ3dzKCZwLT5wcW0s
IGFyZ3MtPnF1ZXVlX2lkLCBtZW0pOw0KPiArCW11dGV4X3VubG9jaygmcC0+bXV0ZXgpOw0KPiAr
DQo+ICsJaWYgKHVubGlrZWx5KHJldHZhbCkpDQo+ICsJCWFtZGdwdV9hbWRrZmRfcmVtb3ZlX2d3
c19mcm9tX3Byb2Nlc3MocC0+a2dkX3Byb2Nlc3NfaW5mbywgbWVtKTsNCj4gKw0KPiArCWFyZ3Mt
PmZpcnN0X2d3cyA9IDA7DQo+ICsJcmV0dXJuIHJldHZhbDsNCj4gK30NCj4gKw0KPiAgIHN0YXRp
YyBpbnQga2ZkX2lvY3RsX2dldF9kbWFidWZfaW5mbyhzdHJ1Y3QgZmlsZSAqZmlsZXAsDQo+ICAg
CQlzdHJ1Y3Qga2ZkX3Byb2Nlc3MgKnAsIHZvaWQgKmRhdGEpDQo+ICAgew0KPiBAQCAtMTc2MSw2
ICsxNzk4LDggQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBhbWRrZmRfaW9jdGxfZGVzYyBhbWRrZmRf
aW9jdGxzW10gPSB7DQo+ICAgCUFNREtGRF9JT0NUTF9ERUYoQU1ES0ZEX0lPQ19JTVBPUlRfRE1B
QlVGLA0KPiAgIAkJCQlrZmRfaW9jdGxfaW1wb3J0X2RtYWJ1ZiwgMCksDQo+ICAgDQo+ICsJQU1E
S0ZEX0lPQ1RMX0RFRihBTURLRkRfSU9DX0FMTE9DX1FVRVVFX0dXUywNCj4gKwkJCWtmZF9pb2N0
bF9hbGxvY19xdWV1ZV9nd3MsIDApLA0KPiAgIH07DQo+ICAgDQo+ICAgI2RlZmluZSBBTURLRkRf
Q09SRV9JT0NUTF9DT1VOVAlBUlJBWV9TSVpFKGFtZGtmZF9pb2N0bHMpDQo+IGRpZmYgLS1naXQg
YS9pbmNsdWRlL3VhcGkvbGludXgva2ZkX2lvY3RsLmggYi9pbmNsdWRlL3VhcGkvbGludXgva2Zk
X2lvY3RsLmgNCj4gaW5kZXggMjA5MTdjNS4uMDcwZDFiYyAxMDA2NDQNCj4gLS0tIGEvaW5jbHVk
ZS91YXBpL2xpbnV4L2tmZF9pb2N0bC5oDQo+ICsrKyBiL2luY2x1ZGUvdWFwaS9saW51eC9rZmRf
aW9jdGwuaA0KPiBAQCAtNDEwLDYgKzQxMCwyMSBAQCBzdHJ1Y3Qga2ZkX2lvY3RsX3VubWFwX21l
bW9yeV9mcm9tX2dwdV9hcmdzIHsNCj4gICAJX191MzIgbl9zdWNjZXNzOwkJLyogdG8vZnJvbSBL
RkQgKi8NCj4gICB9Ow0KPiAgIA0KPiArLyogQWxsb2NhdGUgR1dTIGZvciBzcGVjaWZpYyBxdWV1
ZQ0KPiArICoNCj4gKyAqIEBncHVfaWQ6ICAgICAgZGV2aWNlIGlkZW50aWZpZXINCj4gKyAqIEBx
dWV1ZV9pZDogICAgcXVldWUncyBpZCB0aGF0IEdXUyBpcyBhbGxvY2F0ZWQgZm9yDQo+ICsgKiBA
bnVtX2d3czogICAgIGhvdyBtYW55IEdXUyB0byBhbGxvY2F0ZQ0KPiArICogQGZpcnN0X2d3czog
ICBpbmRleCBvZiB0aGUgZmlyc3QgR1dTIGFsbG9jYXRlZC4NCj4gKyAqICAgICAgICAgICAgICAg
b25seSBzdXBwb3J0IGNvbnRpZ3VvdXMgR1dTIGFsbG9jYXRpb24NCj4gKyAqLw0KPiArc3RydWN0
IGtmZF9pb2N0bF9hbGxvY19xdWV1ZV9nd3NfYXJncyB7DQo+ICsJX191MzIgZ3B1X2lkOwkJLyog
dG8gS0ZEICovDQo+ICsJX191MzIgcXVldWVfaWQ7CQkvKiB0byBLRkQgKi8NCj4gKwlfX3UzMiBu
dW1fZ3dzOwkJLyogdG8gS0ZEICovDQo+ICsJX191MzIgZmlyc3RfZ3dzOwkvKiBmcm9tIEtGRCAq
Lw0KPiArfTsNCj4gKw0KPiAgIHN0cnVjdCBrZmRfaW9jdGxfZ2V0X2RtYWJ1Zl9pbmZvX2FyZ3Mg
ew0KPiAgIAlfX3U2NCBzaXplOwkJLyogZnJvbSBLRkQgKi8NCj4gICAJX191NjQgbWV0YWRhdGFf
cHRyOwkvKiB0byBLRkQgKi8NCj4gQEAgLTUyOSw3ICs1NDQsMTAgQEAgZW51bSBrZmRfbW1pb19y
ZW1hcCB7DQo+ICAgI2RlZmluZSBBTURLRkRfSU9DX0lNUE9SVF9ETUFCVUYJCVwNCj4gICAJCUFN
REtGRF9JT1dSKDB4MUQsIHN0cnVjdCBrZmRfaW9jdGxfaW1wb3J0X2RtYWJ1Zl9hcmdzKQ0KPiAg
IA0KPiArI2RlZmluZSBBTURLRkRfSU9DX0FMTE9DX1FVRVVFX0dXUwkJXA0KPiArCQlBTURLRkRf
SU9XUigweDFFLCBzdHJ1Y3Qga2ZkX2lvY3RsX2FsbG9jX3F1ZXVlX2d3c19hcmdzKQ0KPiArDQo+
ICAgI2RlZmluZSBBTURLRkRfQ09NTUFORF9TVEFSVAkJMHgwMQ0KPiAtI2RlZmluZSBBTURLRkRf
Q09NTUFORF9FTkQJCTB4MUUNCj4gKyNkZWZpbmUgQU1ES0ZEX0NPTU1BTkRfRU5ECQkweDFGDQo+
ICAgDQo+ICAgI2VuZGlmDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
