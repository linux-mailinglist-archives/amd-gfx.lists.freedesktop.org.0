Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7257787469
	for <lists+amd-gfx@lfdr.de>; Fri,  9 Aug 2019 10:41:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 043D66ED34;
	Fri,  9 Aug 2019 08:41:19 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr800072.outbound.protection.outlook.com [40.107.80.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A7186ED34
 for <amd-gfx@lists.freedesktop.org>; Fri,  9 Aug 2019 08:41:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iEjvwZyh2dxlIir/UAbRLMMifmJg+IjtP72tAA4+Nhq9OYzNuw07ubukjjvOOIv4IxVXjMkcATfwZ17WKP92JMXKv0H9lc0cikf9BZmAH10ihCjmNe+6hHzWkTu/zVhwbjCVF9r1UVOlvgdN1ZDJwcX6TwmK/555tOXe0q/H7S72F+0eDO9FUfDOEuuizNGpJ+3bqYGf/D7PhGtSmadw2M99axmqh7COc4bGH7WqnPIz39XS0uq/mheYclBN7TeZ6PE0CwvNjBemmFXWurneviW9oeRZRC9cz8KNKVUMYSaBTuShMVu+slCs7W7pyWqTBDOmEyeVQ8t8HehEs+SoDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B1Oc87VPQPEYhkxHoYFtccxEwDPliPtW5nf/WYvQPo4=;
 b=oZNtVFNeeFC5KRGYIlOA0fURz/nSd9Z+TnYn5oMlGcW6WuCxrmjwCk03kFN4T0gfK3ZR56Py222qHO7xrGmLCsi4OSDPOvjvUsPAycfQEMC4ml93rRzw8khjDrQh8vO7TiBe56hSGus6bqZ+evrTDYXPQ5gs/oIZ6/4qEwNnVkqDfPT+OdbFd4tnudNBdKRmmwRG5w7ta3Jed7k30sb/Zx98DCFKrdH3j6RgwUZUEkzj8sqsG7yRHgJ6qAaeDQdN471V6LrskwYE7YgS9W0D8NvFzZ0AgbMYD2UHYoEDJDINATJBjv0/RF2Vvd2nl+1prGXjSo7sfkXSsTYNMIv+Qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from DM5PR12MB1546.namprd12.prod.outlook.com (10.172.36.23) by
 DM5PR12MB1164.namprd12.prod.outlook.com (10.168.238.144) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2136.20; Fri, 9 Aug 2019 08:41:15 +0000
Received: from DM5PR12MB1546.namprd12.prod.outlook.com
 ([fe80::fc5f:ce01:e8c8:db89]) by DM5PR12MB1546.namprd12.prod.outlook.com
 ([fe80::fc5f:ce01:e8c8:db89%12]) with mapi id 15.20.2157.015; Fri, 9 Aug 2019
 08:41:15 +0000
From: "Koenig, Christian" <Christian.Koenig@amd.com>
To: "Zhou1, Tao" <Tao.Zhou1@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>, "Deucher, Alexander"
 <Alexander.Deucher@amd.com>, "Zhang, Hawking" <Hawking.Zhang@amd.com>
Subject: Re: [PATCH 1/2] drm/amdgpu: implement UMC 64 bits REG operations
Thread-Topic: [PATCH 1/2] drm/amdgpu: implement UMC 64 bits REG operations
Thread-Index: AQHVTog1luZBonGzqUW155zROCbrXqbyf1GA
Date: Fri, 9 Aug 2019 08:41:14 +0000
Message-ID: <36c9cb7a-11ab-5ab7-ba74-4267a08f34b0@amd.com>
References: <20190809075751.5078-1-tao.zhou1@amd.com>
In-Reply-To: <20190809075751.5078-1-tao.zhou1@amd.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-originating-ip: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
x-clientproxiedby: PR0P264CA0161.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1b::29) To DM5PR12MB1546.namprd12.prod.outlook.com
 (2603:10b6:4:8::23)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ec2875ba-d993-4c98-a4fd-08d71ca556bf
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM5PR12MB1164; 
x-ms-traffictypediagnostic: DM5PR12MB1164:
x-microsoft-antispam-prvs: <DM5PR12MB1164A6E896049F958566CF5C83D60@DM5PR12MB1164.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2150;
x-forefront-prvs: 01244308DF
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(39860400002)(136003)(396003)(376002)(346002)(189003)(199004)(71190400001)(71200400001)(14444005)(256004)(76176011)(6506007)(386003)(65826007)(99286004)(186003)(66556008)(66476007)(476003)(64756008)(66446008)(11346002)(478600001)(102836004)(446003)(66946007)(486006)(2616005)(2501003)(46003)(25786009)(316002)(58126008)(110136005)(66574012)(6246003)(53936002)(14454004)(229853002)(6486002)(6436002)(52116002)(8936002)(6512007)(5660300002)(305945005)(8676002)(36756003)(6116002)(64126003)(6636002)(86362001)(31696002)(2906002)(31686004)(65806001)(65956001)(7736002)(81156014)(81166006);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1164;
 H:DM5PR12MB1546.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: XldcJk4BvZdKs4ZL3S/ezrBeihOZFPtOhRAIzqgsHcsk2SN/FJpXqkIE8AwbQfivotg8pvnmMM36q6IzYSyGvIkh6n6MwZu9g/4ELwj9qzE7Ch0Als9bG1vMIW6RCkU8jpei42JG09MPzNycU0tn4UU9CnYOigmT/VbyL3FWTAsz6JLZNFv7mh4j5rFsDBzcE9N2wJUV19cRX6Q/FqiSMOoItEvCSTl8DtVB8p48TqTQbXXGq2ha39j9vBtrRvz1E01pDsaWyPj/jhlUfwweelh8QU8UEiEZJCSzyrbdgD0y1a8o6yfg1UpX61/tsSbhyy3aP4d5d9ciQTXJRAaYrIbs3siMkN93QwxuvZj+bLSBK6bdmHJhJIkHRD5PxYa6Fh0OhkMDnIgiPKT10Ifc+3kUKWS0BOHvxV8h7qWso+E=
Content-ID: <BF5351956DC5DC4FAFD0958403BE9826@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ec2875ba-d993-4c98-a4fd-08d71ca556bf
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Aug 2019 08:41:14.9984 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Iii+/SqLApS/Jrr3TdwCb1xA3Mn893wPUyOrjZASdWVuBk/af3ZUjpKRj/S86gIu
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1164
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B1Oc87VPQPEYhkxHoYFtccxEwDPliPtW5nf/WYvQPo4=;
 b=xUWcOKehyRKQyGFLWQdveGf/SW6B7MKALv7lLFuT7EPjwFf82jbRNRh5eqIpRZemy8eIPAsMgq9vMGSE2DaUr9EoZu2kKmeUE2J0bw/qAFxwnaA5W2sGyTZVyrvH7W11l1DQ8j+b5iLkp/7lqCMcFGxg6P3nd9i8VPA+oUJ1hiE=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Christian.Koenig@amd.com; 
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

UmV2aWV3ZWQtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4g
Zm9yIHRoZSBzZXJpZXMuDQoNCkFtIDA5LjA4LjE5IHVtIDA5OjU3IHNjaHJpZWIgVGFvIFpob3U6
DQo+IGltcGxlbWVudCA2NCBiaXRzIG9wZXJhdGlvbnMgdmlhIDMyIGJpdHMgaW50ZXJmYWNlDQo+
DQo+IHYyOiBtYWtlIHVzZSBvZiBsb3dlcl8zMl9iaXRzKCkgYW5kIHVwcGVyXzMyX2JpdHMoKSBt
YWNyb3MNCj4NCj4gU2lnbmVkLW9mZi1ieTogVGFvIFpob3UgPHRhby56aG91MUBhbWQuY29tPg0K
PiAtLS0NCj4gICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdW1jLmggfCAgOSAr
KysrKysrKysNCj4gICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS91bWNfdjZfMS5jICAgfCAx
MCArKysrKy0tLS0tDQo+ICAgMiBmaWxlcyBjaGFuZ2VkLCAxNCBpbnNlcnRpb25zKCspLCA1IGRl
bGV0aW9ucygtKQ0KPg0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
YW1kZ3B1X3VtYy5oIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3VtYy5oDQo+
IGluZGV4IDllZmRkNjYyNzllNS4uOTc1YWZhMDRkZjA5IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdW1jLmgNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvYW1kZ3B1X3VtYy5oDQo+IEBAIC0yMSw2ICsyMSwxNSBAQA0KPiAgICNpZm5k
ZWYgX19BTURHUFVfVU1DX0hfXw0KPiAgICNkZWZpbmUgX19BTURHUFVfVU1DX0hfXw0KPiAgIA0K
PiArLyogaW1wbGVtZW50IDY0IGJpdHMgUkVHIG9wZXJhdGlvbnMgdmlhIDMyIGJpdHMgaW50ZXJm
YWNlICovDQo+ICsjZGVmaW5lIFJSRUc2NF9VTUMocmVnKQkoUlJFRzMyKHJlZykgfCBcDQo+ICsJ
CQkJKCh1aW50NjRfdClSUkVHMzIoKHJlZykgKyAxKSA8PCAzMikpDQo+ICsjZGVmaW5lIFdSRUc2
NF9VTUMocmVnLCB2KQlcDQo+ICsJZG8gewlcDQo+ICsJCVdSRUczMigocmVnKSwgbG93ZXJfMzJf
Yml0cyh2KSk7CVwNCj4gKwkJV1JFRzMyKChyZWcpICsgMSwgdXBwZXJfMzJfYml0cyh2KSk7CVwN
Cj4gKwl9IHdoaWxlICgwKQ0KPiArDQo+ICAgLyoNCj4gICAgKiB2b2lkICgqZnVuYykoc3RydWN0
IGFtZGdwdV9kZXZpY2UgKmFkZXYsIHN0cnVjdCByYXNfZXJyX2RhdGEgKmVycl9kYXRhLA0KPiAg
ICAqCQkJCXVpbnQzMl90IHVtY19yZWdfb2Zmc2V0LCB1aW50MzJfdCBjaGFubmVsX2luZGV4KQ0K
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvdW1jX3Y2XzEuYyBiL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3VtY192Nl8xLmMNCj4gaW5kZXggNjRkZjM3Yjg2MGRk
Li44NTAyZTczNmY3MjEgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L3VtY192Nl8xLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvdW1jX3Y2XzEu
Yw0KPiBAQCAtMTE2LDcgKzExNiw3IEBAIHN0YXRpYyB2b2lkIHVtY192Nl8xX3F1ZXJ5X2NvcnJl
Y3RhYmxlX2Vycm9yX2NvdW50KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LA0KPiAgIA0KPiAg
IAkvKiBjaGVjayBmb3IgU1JBTSBjb3JyZWN0YWJsZSBlcnJvcg0KPiAgIAkgIE1DVU1DX1NUQVRV
UyBpcyBhIDY0IGJpdCByZWdpc3RlciAqLw0KPiAtCW1jX3VtY19zdGF0dXMgPSBSUkVHNjQobWNf
dW1jX3N0YXR1c19hZGRyICsgdW1jX3JlZ19vZmZzZXQpOw0KPiArCW1jX3VtY19zdGF0dXMgPSBS
UkVHNjRfVU1DKG1jX3VtY19zdGF0dXNfYWRkciArIHVtY19yZWdfb2Zmc2V0KTsNCj4gICAJaWYg
KFJFR19HRVRfRklFTEQobWNfdW1jX3N0YXR1cywgTUNBX1VNQ19VTUMwX01DVU1DX1NUQVRVU1Qw
LCBFcnJvckNvZGVFeHQpID09IDYgJiYNCj4gICAJICAgIFJFR19HRVRfRklFTEQobWNfdW1jX3N0
YXR1cywgTUNBX1VNQ19VTUMwX01DVU1DX1NUQVRVU1QwLCBWYWwpID09IDEgJiYNCj4gICAJICAg
IFJFR19HRVRfRklFTEQobWNfdW1jX3N0YXR1cywgTUNBX1VNQ19VTUMwX01DVU1DX1NUQVRVU1Qw
LCBDRUNDKSA9PSAxKQ0KPiBAQCAtMTM0LDcgKzEzNCw3IEBAIHN0YXRpYyB2b2lkIHVtY192Nl8x
X3F1ZXJyeV91bmNvcnJlY3RhYmxlX2Vycm9yX2NvdW50KHN0cnVjdCBhbWRncHVfZGV2aWNlICph
ZGV2DQo+ICAgICAgICAgICAgICAgICAgIFNPQzE1X1JFR19PRkZTRVQoVU1DLCAwLCBtbU1DQV9V
TUNfVU1DMF9NQ1VNQ19TVEFUVVNUMCk7DQo+ICAgDQo+ICAgCS8qIGNoZWNrIHRoZSBNQ1VNQ19T
VEFUVVMgKi8NCj4gLQltY191bWNfc3RhdHVzID0gUlJFRzY0KG1jX3VtY19zdGF0dXNfYWRkciAr
IHVtY19yZWdfb2Zmc2V0KTsNCj4gKwltY191bWNfc3RhdHVzID0gUlJFRzY0X1VNQyhtY191bWNf
c3RhdHVzX2FkZHIgKyB1bWNfcmVnX29mZnNldCk7DQo+ICAgCWlmICgoUkVHX0dFVF9GSUVMRCht
Y191bWNfc3RhdHVzLCBNQ0FfVU1DX1VNQzBfTUNVTUNfU1RBVFVTVDAsIFZhbCkgPT0gMSkgJiYN
Cj4gICAJICAgIChSRUdfR0VUX0ZJRUxEKG1jX3VtY19zdGF0dXMsIE1DQV9VTUNfVU1DMF9NQ1VN
Q19TVEFUVVNUMCwgRGVmZXJyZWQpID09IDEgfHwNCj4gICAJICAgIFJFR19HRVRfRklFTEQobWNf
dW1jX3N0YXR1cywgTUNBX1VNQ19VTUMwX01DVU1DX1NUQVRVU1QwLCBVRUNDKSA9PSAxIHx8DQo+
IEBAIC0xNzMsMTEgKzE3MywxMSBAQCBzdGF0aWMgdm9pZCB1bWNfdjZfMV9xdWVyeV9lcnJvcl9h
ZGRyZXNzKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LA0KPiAgIAkvKiBza2lwIGVycm9yIGFk
ZHJlc3MgcHJvY2VzcyBpZiAtRU5PTUVNICovDQo+ICAgCWlmICghZXJyX2RhdGEtPmVycl9hZGRy
KSB7DQo+ICAgCQkvKiBjbGVhciB1bWMgc3RhdHVzICovDQo+IC0JCVdSRUc2NChtY191bWNfc3Rh
dHVzX2FkZHIgKyB1bWNfcmVnX29mZnNldCwgMHgwVUxMKTsNCj4gKwkJV1JFRzY0X1VNQyhtY191
bWNfc3RhdHVzX2FkZHIgKyB1bWNfcmVnX29mZnNldCwgMHgwVUxMKTsNCj4gICAJCXJldHVybjsN
Cj4gICAJfQ0KPiAgIA0KPiAtCW1jX3VtY19zdGF0dXMgPSBSUkVHNjQobWNfdW1jX3N0YXR1c19h
ZGRyICsgdW1jX3JlZ19vZmZzZXQpOw0KPiArCW1jX3VtY19zdGF0dXMgPSBSUkVHNjRfVU1DKG1j
X3VtY19zdGF0dXNfYWRkciArIHVtY19yZWdfb2Zmc2V0KTsNCj4gICANCj4gICAJLyogY2FsY3Vs
YXRlIGVycm9yIGFkZHJlc3MgaWYgdWUvY2UgZXJyb3IgaXMgZGV0ZWN0ZWQgKi8NCj4gICAJaWYg
KFJFR19HRVRfRklFTEQobWNfdW1jX3N0YXR1cywgTUNBX1VNQ19VTUMwX01DVU1DX1NUQVRVU1Qw
LCBWYWwpID09IDEgJiYNCj4gQEAgLTIwMCw3ICsyMDAsNyBAQCBzdGF0aWMgdm9pZCB1bWNfdjZf
MV9xdWVyeV9lcnJvcl9hZGRyZXNzKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LA0KPiAgIAl9
DQo+ICAgDQo+ICAgCS8qIGNsZWFyIHVtYyBzdGF0dXMgKi8NCj4gLQlXUkVHNjQobWNfdW1jX3N0
YXR1c19hZGRyICsgdW1jX3JlZ19vZmZzZXQsIDB4MFVMTCk7DQo+ICsJV1JFRzY0X1VNQyhtY191
bWNfc3RhdHVzX2FkZHIgKyB1bWNfcmVnX29mZnNldCwgMHgwVUxMKTsNCj4gICB9DQo+ICAgDQo+
ICAgc3RhdGljIHZvaWQgdW1jX3Y2XzFfcXVlcnlfcmFzX2Vycm9yX2FkZHJlc3Moc3RydWN0IGFt
ZGdwdV9kZXZpY2UgKmFkZXYsDQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1k
LWdmeA==
