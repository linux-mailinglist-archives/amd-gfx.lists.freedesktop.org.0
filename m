Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68BCF28C91
	for <lists+amd-gfx@lfdr.de>; Thu, 23 May 2019 23:44:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C585F89FE8;
	Thu, 23 May 2019 21:44:28 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700058.outbound.protection.outlook.com [40.107.70.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF17789FE8
 for <amd-gfx@lists.freedesktop.org>; Thu, 23 May 2019 21:44:27 +0000 (UTC)
Received: from DM6PR12MB3947.namprd12.prod.outlook.com (10.255.174.156) by
 DM6PR12MB3051.namprd12.prod.outlook.com (20.178.30.93) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1922.17; Thu, 23 May 2019 21:44:25 +0000
Received: from DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::2916:eda4:a1fd:fd36]) by DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::2916:eda4:a1fd:fd36%3]) with mapi id 15.20.1922.013; Thu, 23 May 2019
 21:44:25 +0000
From: "Kuehling, Felix" <Felix.Kuehling@amd.com>
To: "Zeng, Oak" <Oak.Zeng@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 6/7] drm/amdkfd: New IOCTL to allocate queue GWS
Thread-Topic: [PATCH 6/7] drm/amdkfd: New IOCTL to allocate queue GWS
Thread-Index: AQHVEZcWMx1A7fYHIkGZB7Xrp4dX7qZ5PjEA
Date: Thu, 23 May 2019 21:44:25 +0000
Message-ID: <eecd7983-5233-ebd9-df96-b24c719f69b2@amd.com>
References: <1558636843-9867-1-git-send-email-Oak.Zeng@amd.com>
 <1558636843-9867-6-git-send-email-Oak.Zeng@amd.com>
In-Reply-To: <1558636843-9867-6-git-send-email-Oak.Zeng@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
x-clientproxiedby: YTXPR0101CA0049.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:1::26) To DM6PR12MB3947.namprd12.prod.outlook.com
 (2603:10b6:5:1cb::28)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9fc31a68-0614-4cd4-d848-08d6dfc7d30d
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:DM6PR12MB3051; 
x-ms-traffictypediagnostic: DM6PR12MB3051:
x-microsoft-antispam-prvs: <DM6PR12MB305185CF38628162FFA0E74C92010@DM6PR12MB3051.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4941;
x-forefront-prvs: 00462943DE
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(346002)(376002)(39850400004)(396003)(366004)(136003)(199004)(189003)(25786009)(68736007)(6246003)(478600001)(99286004)(4326008)(14454004)(64126003)(53936002)(186003)(72206003)(65826007)(256004)(14444005)(26005)(71190400001)(71200400001)(2501003)(66446008)(66946007)(2616005)(486006)(76176011)(66556008)(64756008)(66066001)(65806001)(8936002)(65956001)(81166006)(81156014)(8676002)(52116002)(66476007)(73956011)(386003)(476003)(36756003)(305945005)(102836004)(31696002)(6512007)(6506007)(7736002)(53546011)(11346002)(446003)(316002)(6436002)(3846002)(6116002)(31686004)(6486002)(86362001)(229853002)(58126008)(110136005)(2906002)(5660300002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3051;
 H:DM6PR12MB3947.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 0X8sZnRX5kcJafSnAeL3IzdI68tVWg+uFo+4tLrtw78qtPrjDEapH9ISA7HF83GDZA92HxFgwxDcIMreW38MHiL6XxjIOZzpxVAJWjgp8yXldOUnPrScKw5RxnnCpGkFrxGM089xJZF2FXQstaT/aXr+xJSbLRWbH8AMVs2kSv+cjKJZ7E4/2QTST+qoqKeB8Xw3cuUUEEFCF6mH0rUirFc0NnCxse3V7tpmNK4/2U1/zGMmiVTfvwKot/kt6643rYqDihlH6ldQtS08JaDFVHs1hLfHhFpo338zLMY0v8HEs1Iik5kCfbveeov7s3VJSnk2fy0iQce+Afv5hzMcrIjC1vpZzQhOZNc3j9IqVHHXcJ3rfX0TOn4gn7ulQxJEfMBmAAdGFzhHG3Eht53shyHgOsuf6X/EJIIJe56vYiA=
Content-ID: <4B0F3F4D18A90547B1B221ECB3519C62@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9fc31a68-0614-4cd4-d848-08d6dfc7d30d
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 May 2019 21:44:25.4811 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fkuehlin@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3051
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/WEodDqFpz64+Qa5fooFyaUkDFdlTf3NR5U4PGQJAQU=;
 b=lGAulthGvtjvRgSI+xaKRYsOJVwe77X1ZGXmPf1wQdXOLMdRCCiIEozajNFfMHSojoeHeSHI9lAedz+L9pL/dlcqSLt3RwVOUoycqelcjLG4CCaiv1oDB4fP8cO/n/71RyNlR/DdZl6GExcb+9P8rmnY6Ddpo9+iBbA6bGueiIg=
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

DQpPbiAyMDE5LTA1LTIzIDI6NDEgcC5tLiwgWmVuZywgT2FrIHdyb3RlOg0KPiBBZGQgYSBuZXcg
a2ZkIGlvY3RsIHRvIGFsbG9jYXRlIHF1ZXVlIEdXUy4gUXVldWUNCj4gR1dTIGlzIHJlbGVhc2Vk
IG9uIHF1ZXVlIGRlc3Ryb3kuDQo+DQo+IENoYW5nZS1JZDogSTYwMTUzYzI2YTU3Nzk5MmFkODcz
ZTQyOTJlNzU5ZTVjM2Q1YmJkMTUNCj4gU2lnbmVkLW9mZi1ieTogT2FrIFplbmcgPE9hay5aZW5n
QGFtZC5jb20+DQo+IC0tLQ0KPiAgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9jaGFy
ZGV2LmMgfCAzMCArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysNCj4gICBpbmNsdWRlL3Vh
cGkvbGludXgva2ZkX2lvY3RsLmggICAgICAgICAgIHwgMjAgKysrKysrKysrKysrKysrKysrKy0N
Cj4gICAyIGZpbGVzIGNoYW5nZWQsIDQ5IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCj4N
Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9jaGFyZGV2LmMg
Yi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfY2hhcmRldi5jDQo+IGluZGV4IDM4YWU1
M2YuLmYzZjA4ZmUgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tm
ZF9jaGFyZGV2LmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX2NoYXJk
ZXYuYw0KPiBAQCAtMTU1OSw2ICsxNTU5LDM0IEBAIHN0YXRpYyBpbnQga2ZkX2lvY3RsX3VubWFw
X21lbW9yeV9mcm9tX2dwdShzdHJ1Y3QgZmlsZSAqZmlsZXAsDQo+ICAgCXJldHVybiBlcnI7DQo+
ICAgfQ0KPiAgIA0KPiArc3RhdGljIGludCBrZmRfaW9jdGxfYWxsb2NfcXVldWVfZ3dzKHN0cnVj
dCBmaWxlICpmaWxlcCwNCj4gKwkJc3RydWN0IGtmZF9wcm9jZXNzICpwLCB2b2lkICpkYXRhKQ0K
PiArew0KPiArCWludCByZXR2YWw7DQo+ICsJc3RydWN0IGtmZF9pb2N0bF9hbGxvY19xdWV1ZV9n
d3NfYXJncyAqYXJncyA9IGRhdGE7DQo+ICsJc3RydWN0IGtmZF9kZXYgKmRldiA9IE5VTEw7DQo+
ICsNCj4gKwlpZiAoYXJncy0+bnVtX2d3cyA9PSAwKQ0KPiArCQlyZXR1cm4gLUVJTlZBTDsNCg0K
VGhpcyBjb3VsZCBiZSB1c2VmdWwgdG8gYWxsb3cgcmVsZWFzaW5nIEdXUyByZXNvdXJjZXMgd2l0
aG91dCBoYXZpbmcgdG8gDQpkZXN0cm95IHRoZSBxdWV1ZS4gU2VlIGFsc28gbXkgY29tbWVudCBp
biBwYXRjaCA1Lg0KDQpPdGhlciB0aGFuIHRoYXQgdGhpcyBsb29rcyBnb29kIHRvIG1lLg0KDQpS
ZWdhcmRzLA0KIMKgIEZlbGl4DQoNCg0KPiArDQo+ICsJaWYgKCFod3NfZ3dzX3N1cHBvcnQgfHwN
Cj4gKwkJZGV2LT5kcW0tPnNjaGVkX3BvbGljeSA9PSBLRkRfU0NIRURfUE9MSUNZX05PX0hXUykN
Cj4gKwkJcmV0dXJuIC1FSU5WQUw7DQo+ICsNCj4gKwlkZXYgPSBrZmRfZGV2aWNlX2J5X2lkKGFy
Z3MtPmdwdV9pZCk7DQo+ICsJaWYgKCFkZXYpIHsNCj4gKwkJcHJfZGVidWcoIkNvdWxkIG5vdCBm
aW5kIGdwdSBpZCAweCV4XG4iLCBhcmdzLT5ncHVfaWQpOw0KPiArCQlyZXR1cm4gLUVJTlZBTDsN
Cj4gKwl9DQo+ICsNCj4gKwltdXRleF9sb2NrKCZwLT5tdXRleCk7DQo+ICsJcmV0dmFsID0gcHFt
X3NldF9nd3MoJnAtPnBxbSwgYXJncy0+cXVldWVfaWQsIGRldi0+Z3dzKTsNCj4gKwltdXRleF91
bmxvY2soJnAtPm11dGV4KTsNCj4gKw0KPiArCWFyZ3MtPmZpcnN0X2d3cyA9IDA7DQo+ICsJcmV0
dXJuIHJldHZhbDsNCj4gK30NCj4gKw0KPiAgIHN0YXRpYyBpbnQga2ZkX2lvY3RsX2dldF9kbWFi
dWZfaW5mbyhzdHJ1Y3QgZmlsZSAqZmlsZXAsDQo+ICAgCQlzdHJ1Y3Qga2ZkX3Byb2Nlc3MgKnAs
IHZvaWQgKmRhdGEpDQo+ICAgew0KPiBAQCAtMTc2MSw2ICsxNzg5LDggQEAgc3RhdGljIGNvbnN0
IHN0cnVjdCBhbWRrZmRfaW9jdGxfZGVzYyBhbWRrZmRfaW9jdGxzW10gPSB7DQo+ICAgCUFNREtG
RF9JT0NUTF9ERUYoQU1ES0ZEX0lPQ19JTVBPUlRfRE1BQlVGLA0KPiAgIAkJCQlrZmRfaW9jdGxf
aW1wb3J0X2RtYWJ1ZiwgMCksDQo+ICAgDQo+ICsJQU1ES0ZEX0lPQ1RMX0RFRihBTURLRkRfSU9D
X0FMTE9DX1FVRVVFX0dXUywNCj4gKwkJCWtmZF9pb2N0bF9hbGxvY19xdWV1ZV9nd3MsIDApLA0K
PiAgIH07DQo+ICAgDQo+ICAgI2RlZmluZSBBTURLRkRfQ09SRV9JT0NUTF9DT1VOVAlBUlJBWV9T
SVpFKGFtZGtmZF9pb2N0bHMpDQo+IGRpZmYgLS1naXQgYS9pbmNsdWRlL3VhcGkvbGludXgva2Zk
X2lvY3RsLmggYi9pbmNsdWRlL3VhcGkvbGludXgva2ZkX2lvY3RsLmgNCj4gaW5kZXggMjA5MTdj
NS4uMDcwZDFiYyAxMDA2NDQNCj4gLS0tIGEvaW5jbHVkZS91YXBpL2xpbnV4L2tmZF9pb2N0bC5o
DQo+ICsrKyBiL2luY2x1ZGUvdWFwaS9saW51eC9rZmRfaW9jdGwuaA0KPiBAQCAtNDEwLDYgKzQx
MCwyMSBAQCBzdHJ1Y3Qga2ZkX2lvY3RsX3VubWFwX21lbW9yeV9mcm9tX2dwdV9hcmdzIHsNCj4g
ICAJX191MzIgbl9zdWNjZXNzOwkJLyogdG8vZnJvbSBLRkQgKi8NCj4gICB9Ow0KPiAgIA0KPiAr
LyogQWxsb2NhdGUgR1dTIGZvciBzcGVjaWZpYyBxdWV1ZQ0KPiArICoNCj4gKyAqIEBncHVfaWQ6
ICAgICAgZGV2aWNlIGlkZW50aWZpZXINCj4gKyAqIEBxdWV1ZV9pZDogICAgcXVldWUncyBpZCB0
aGF0IEdXUyBpcyBhbGxvY2F0ZWQgZm9yDQo+ICsgKiBAbnVtX2d3czogICAgIGhvdyBtYW55IEdX
UyB0byBhbGxvY2F0ZQ0KPiArICogQGZpcnN0X2d3czogICBpbmRleCBvZiB0aGUgZmlyc3QgR1dT
IGFsbG9jYXRlZC4NCj4gKyAqICAgICAgICAgICAgICAgb25seSBzdXBwb3J0IGNvbnRpZ3VvdXMg
R1dTIGFsbG9jYXRpb24NCj4gKyAqLw0KPiArc3RydWN0IGtmZF9pb2N0bF9hbGxvY19xdWV1ZV9n
d3NfYXJncyB7DQo+ICsJX191MzIgZ3B1X2lkOwkJLyogdG8gS0ZEICovDQo+ICsJX191MzIgcXVl
dWVfaWQ7CQkvKiB0byBLRkQgKi8NCj4gKwlfX3UzMiBudW1fZ3dzOwkJLyogdG8gS0ZEICovDQo+
ICsJX191MzIgZmlyc3RfZ3dzOwkvKiBmcm9tIEtGRCAqLw0KPiArfTsNCj4gKw0KPiAgIHN0cnVj
dCBrZmRfaW9jdGxfZ2V0X2RtYWJ1Zl9pbmZvX2FyZ3Mgew0KPiAgIAlfX3U2NCBzaXplOwkJLyog
ZnJvbSBLRkQgKi8NCj4gICAJX191NjQgbWV0YWRhdGFfcHRyOwkvKiB0byBLRkQgKi8NCj4gQEAg
LTUyOSw3ICs1NDQsMTAgQEAgZW51bSBrZmRfbW1pb19yZW1hcCB7DQo+ICAgI2RlZmluZSBBTURL
RkRfSU9DX0lNUE9SVF9ETUFCVUYJCVwNCj4gICAJCUFNREtGRF9JT1dSKDB4MUQsIHN0cnVjdCBr
ZmRfaW9jdGxfaW1wb3J0X2RtYWJ1Zl9hcmdzKQ0KPiAgIA0KPiArI2RlZmluZSBBTURLRkRfSU9D
X0FMTE9DX1FVRVVFX0dXUwkJXA0KPiArCQlBTURLRkRfSU9XUigweDFFLCBzdHJ1Y3Qga2ZkX2lv
Y3RsX2FsbG9jX3F1ZXVlX2d3c19hcmdzKQ0KPiArDQo+ICAgI2RlZmluZSBBTURLRkRfQ09NTUFO
RF9TVEFSVAkJMHgwMQ0KPiAtI2RlZmluZSBBTURLRkRfQ09NTUFORF9FTkQJCTB4MUUNCj4gKyNk
ZWZpbmUgQU1ES0ZEX0NPTU1BTkRfRU5ECQkweDFGDQo+ICAgDQo+ICAgI2VuZGlmDQpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcg
bGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
