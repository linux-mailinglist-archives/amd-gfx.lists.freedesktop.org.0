Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AAA61ED56
	for <lists+amd-gfx@lfdr.de>; Tue, 30 Apr 2019 01:34:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5C8B892CD;
	Mon, 29 Apr 2019 23:34:43 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr740071.outbound.protection.outlook.com [40.107.74.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC30D892CD
 for <amd-gfx@lists.freedesktop.org>; Mon, 29 Apr 2019 23:34:41 +0000 (UTC)
Received: from BYAPR12MB3176.namprd12.prod.outlook.com (20.179.92.82) by
 BYAPR12MB2615.namprd12.prod.outlook.com (20.176.255.204) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1835.15; Mon, 29 Apr 2019 23:34:40 +0000
Received: from BYAPR12MB3176.namprd12.prod.outlook.com
 ([fe80::9118:73f2:809c:22c7]) by BYAPR12MB3176.namprd12.prod.outlook.com
 ([fe80::9118:73f2:809c:22c7%4]) with mapi id 15.20.1835.010; Mon, 29 Apr 2019
 23:34:40 +0000
From: "Kuehling, Felix" <Felix.Kuehling@amd.com>
To: "Huang, Trigger" <Trigger.Huang@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/amdgpu: Unmap CSA under SR-IOV in KFD path
Thread-Topic: [PATCH] drm/amdgpu: Unmap CSA under SR-IOV in KFD path
Thread-Index: AQHU/uQdzmtwg4Kz50SgrXPJ+cTqcg==
Date: Mon, 29 Apr 2019 23:34:39 +0000
Message-ID: <be96ca90-23c2-e442-42d0-7889436b0393@amd.com>
References: <1556447115-1689-1-git-send-email-Trigger.Huang@amd.com>
In-Reply-To: <1556447115-1689-1-git-send-email-Trigger.Huang@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
x-clientproxiedby: YTXPR0101CA0037.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:1::14) To BYAPR12MB3176.namprd12.prod.outlook.com
 (2603:10b6:a03:133::18)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 46e1a5aa-b743-40e3-14f3-08d6ccfb3f8e
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:BYAPR12MB2615; 
x-ms-traffictypediagnostic: BYAPR12MB2615:
x-microsoft-antispam-prvs: <BYAPR12MB2615C0AC86BDB4BF6853706D92390@BYAPR12MB2615.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 0022134A87
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(366004)(376002)(39860400002)(136003)(396003)(346002)(189003)(199004)(2501003)(6436002)(5660300002)(36756003)(6486002)(8936002)(53546011)(26005)(229853002)(14454004)(316002)(52116002)(71190400001)(99286004)(71200400001)(76176011)(6116002)(102836004)(186003)(58126008)(64126003)(110136005)(2906002)(6246003)(6506007)(386003)(25786009)(81156014)(8676002)(3846002)(65826007)(73956011)(66946007)(66556008)(64756008)(66476007)(66446008)(81166006)(305945005)(65956001)(31696002)(97736004)(66066001)(6512007)(68736007)(31686004)(53936002)(2616005)(486006)(65806001)(7736002)(478600001)(11346002)(72206003)(14444005)(256004)(476003)(86362001)(446003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR12MB2615;
 H:BYAPR12MB3176.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: bX8fPoCC6xyjaZ9nldgbDArLJ095LRCghjW209N7f4050HHpA+0zG4wwMQnDiYfawwF+ADwJHnn6ntrWYZgufGjYDwcr3oWuXgYmiP18xT+pt74QV90sjnYC7LeZomcD91MCvrPG1fE7bzvK5oin67tAieNBPc0DP1Mj9+p93hXX44TESHVAKWqAMW89bIuAj6vnIsScoi/z/1lZISXweS8qndP2gjhS9CdS7zB6bQjNzg5t0+J1qdxeO44t5dZovQEq2tjysrD+SVF6+zL7GWjHGvCPHs4C2VYEq7E+u8PwVM2abQ06mMIUwhdGsgXm3GcNWjfhXk2QJwvVpA+c8SNy7HY5uC6NSVcJk1iD/lgy7pd7UnhhbMRbqC8yYrG8/Zv98xLTT1LIa/5n/VfIkCbvC72dTamY/v2ZKbrO0gA=
Content-ID: <8FBE7DCBABD1314BB8FD711A505EDC82@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 46e1a5aa-b743-40e3-14f3-08d6ccfb3f8e
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Apr 2019 23:34:39.8360 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2615
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amd-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ib3/fEa5Fc0ZUpHwiaMq91bC5lC90CVfqWJF//KPAbY=;
 b=JkGa3G4wJ/1lYFXQ4eGoHfDIUSRaRSrsikAiDrTZXWj6HvcQJqz/ylRcjiUoxY0sIrNVYlrZVByq/fQvnoNhtsKP5gYnlimBjg44GD+aA2NBqMeV5Uc64f34SiqSPYZngZ40fhfAB+h7hP0NrIr75yd/xQOLDqcyUY8ckwtICNE=
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

SSByZW1lbWJlciBhIHBhc3QgZGlzY3Vzc2lvbiB0byBjaGFuZ2UgdGhlIENTQSBhbGxvY2F0aW9u
L21hcHBpbmcgc2NoZW1lIA0KdG8gYXZvaWQgdGhpcyBpc3N1ZSBpbiB0aGUgZmlyc3QgcGxhY2Uu
IENhbiBhZGRpbmcgdGhlIENTQSB0byB0aGUgVk0gYmUgDQpkZWxheWVkIGEgbGl0dGxlIHRvIGEg
cG9pbnQgYWZ0ZXIgdGhlIFZNIGdldHMgY29udmVydGVkIHRvIGEgY29tcHV0ZSBWTT8gDQpNYXli
ZSB0aGUgZmlyc3QgY29tbWFuZCBzdWJtaXNzaW9uPw0KDQpSZWdhcmRzLA0KIMKgIEZlbGl4DQoN
Ck9uIDIwMTktMDQtMjggNjoyNSBhLm0uLCBUcmlnZ2VyIEh1YW5nIHdyb3RlOg0KPiBJbiBhbWRn
cHUgb3BlbiBwYXRoLCBDU0Egd2lsbCBiZSBtYXBwZW5lZCBpbiBWTSwgc28gd2hlbiBvcGVuaW5n
DQo+IEtGRCwgY2FsbGluZyBtZGdwdV92bV9tYWtlX2NvbXB1dGUgIHdpbGwgZmFpbCBiZWNhdXNl
IGl0IGZvdW5kIHRoaXMNCj4gVk0gaXMgbm90IGEgY2xlYW4gVk0gd2l0aCBzb21lIG1hcHBpbmdz
LCBhcyBhIHJlc3VsdCwgaXQgd2lsbCBsZWFkDQo+IHRvIGZhaWxlZCB0byBjcmVhdGUgcHJvY2Vz
cyBWTSBvYmplY3QNCj4NCj4gVGhlIGZpeCBpcyB0cnkgdG8gdW5tYXAgQ1NBLCBhbmQgYWN0dWFs
bHkgQ1NBIGlzIG5vdCBuZWVkZWQgaW4NCj4gY29tcHV0ZSBWRiB3b3JsZCBzd2l0Y2gNCj4NCj4g
U2lnbmVkLW9mZi1ieTogVHJpZ2dlciBIdWFuZyA8VHJpZ2dlci5IdWFuZ0BhbWQuY29tPg0KPiAt
LS0NCj4gICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfYW1ka2ZkX2dwdXZtLmMg
fCAxMCArKysrKysrKysrDQo+ICAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2tt
cy5jICAgICAgICAgIHwgIDIgKy0NCj4gICAyIGZpbGVzIGNoYW5nZWQsIDExIGluc2VydGlvbnMo
KyksIDEgZGVsZXRpb24oLSkNCj4NCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L2FtZGdwdV9hbWRrZmRfZ3B1dm0uYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L2FtZGdwdV9hbWRrZmRfZ3B1dm0uYw0KPiBpbmRleCA2OTdiOGVmLi5lMGJjNDU3IDEwMDY0NA0K
PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfYW1ka2ZkX2dwdXZtLmMN
Cj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2FtZGtmZF9ncHV2bS5j
DQo+IEBAIC05NTYsNiArOTU2LDE2IEBAIGludCBhbWRncHVfYW1ka2ZkX2dwdXZtX2FjcXVpcmVf
cHJvY2Vzc192bShzdHJ1Y3Qga2dkX2RldiAqa2dkLA0KPiAgIAlpZiAoYXZtLT5wcm9jZXNzX2lu
Zm8pDQo+ICAgCQlyZXR1cm4gLUVJTlZBTDsNCj4gICANCj4gKwkvKiBEZWxldGUgQ1NBIG1hcHBp
bmcgdG8gbWFrZSBzdXJlIHRoaXMgVk0gaXMgYSBjbGVhbiBWTSAgYmVmb3JlDQo+ICsJICogIGNv
bnZlcnRpbmcgVk0NCj4gKwkgKi8NCj4gKwlpZiAoYW1kZ3B1X3NyaW92X3ZmKGFkZXYpICYmIGRy
dl9wcml2LT5jc2FfdmEpIHsNCj4gKwkJYW1kZ3B1X2JvX3Jlc2VydmUoYWRldi0+dmlydC5jc2Ff
b2JqLCB0cnVlKTsNCj4gKwkJYW1kZ3B1X3ZtX2JvX3JtdihhZGV2LCBkcnZfcHJpdi0+Y3NhX3Zh
KTsNCj4gKwkJZHJ2X3ByaXYtPmNzYV92YSA9IE5VTEw7DQo+ICsJCWFtZGdwdV9ib191bnJlc2Vy
dmUoYWRldi0+dmlydC5jc2Ffb2JqKTsNCj4gKwl9DQo+ICsNCj4gICAJLyogQ29udmVydCBWTSBp
bnRvIGEgY29tcHV0ZSBWTSAqLw0KPiAgIAlyZXQgPSBhbWRncHVfdm1fbWFrZV9jb21wdXRlKGFk
ZXYsIGF2bSwgcGFzaWQpOw0KPiAgIAlpZiAocmV0KQ0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2ttcy5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvYW1kZ3B1X2ttcy5jDQo+IGluZGV4IGRhN2I0ZmUuLjM2MWMyZTUgMTAwNjQ0DQo+IC0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9rbXMuYw0KPiArKysgYi9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfa21zLmMNCj4gQEAgLTEwNjksNyArMTA2OSw3IEBA
IHZvaWQgYW1kZ3B1X2RyaXZlcl9wb3N0Y2xvc2Vfa21zKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYs
DQo+ICAgDQo+ICAgCWFtZGdwdV92bV9ib19ybXYoYWRldiwgZnByaXYtPnBydF92YSk7DQo+ICAg
DQo+IC0JaWYgKGFtZGdwdV9zcmlvdl92ZihhZGV2KSkgew0KPiArCWlmIChhbWRncHVfc3Jpb3Zf
dmYoYWRldikgJiYgZnByaXYtPmNzYV92YSkgew0KPiAgIAkJLyogVE9ETzogaG93IHRvIGhhbmRs
ZSByZXNlcnZlIGZhaWx1cmUgKi8NCj4gICAJCUJVR19PTihhbWRncHVfYm9fcmVzZXJ2ZShhZGV2
LT52aXJ0LmNzYV9vYmosIHRydWUpKTsNCj4gICAJCWFtZGdwdV92bV9ib19ybXYoYWRldiwgZnBy
aXYtPmNzYV92YSk7DQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
