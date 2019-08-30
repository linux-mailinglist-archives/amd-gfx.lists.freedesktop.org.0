Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5E71A3EC5
	for <lists+amd-gfx@lfdr.de>; Fri, 30 Aug 2019 22:08:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0051A6E3C6;
	Fri, 30 Aug 2019 20:08:21 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr820082.outbound.protection.outlook.com [40.107.82.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2BD76E3C6
 for <amd-gfx@lists.freedesktop.org>; Fri, 30 Aug 2019 20:08:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ToLZTBdVS6VQDwwNaxqaLpFcH7EL8uS5PEeF43u8h008LcgMX72+dtHgAOYGWsaRUreggR0jyDJwJOwcmlrapOdJVcvQ9tGoEdJIFAh4TDYv1smseQ5g3Elb5rh7E8LykEYljIA2lU1bv2IUNUZ6a20EpS6qbsASwQySj3n9XqZzupetcxTn47+8A3z7sTI5cHh4SabLfxh6Eo3SVLAAc27b0uq8JYiii6kxmmEXLG+4BjX0egxyMN8UzMrX2zF04rAgwgylhag+SrVKmN+kRG/EyxGn5dTk1/pmnLfjH1XGCvn40e4a4gDbYJ+uKk5wvlI3jTdDKmu1MYN+ixGszQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y6X6Nindb1zYrriL2AlEqsuh9GgnbZpPqkPC8WMfYEo=;
 b=MdK+o61MZ/ZYVQpo/e1LTp/xRcBL+vByNVP5bQlAs5uvc280vQnLbDRhbryvnV1jO9IHV/8Tl9AERO0o+5FdYpeVF4cTGnuHqOBh6c59eOkk+g2ZLJ1P8PMV+MSFpA/IeKGXXDbqNlXspdQJSSUg3XZtf2bQijVJCLmYQWs4os6lMZccXjBKZN5I5d4T6YyxgC9+aBptGLzOxJzoCpb3Pk8tDIk06v3lPTgbuVOlUMQUSmIDrGY2+f+0ZBa50d6WMEPap84TrYppOlYilLufq1DtxYIORblIf+qCoioFXN1OSQyL7W1Ya9efnCuAaIKki7wdeGbfni2Wz7WZSoLBsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM6PR12MB3947.namprd12.prod.outlook.com (10.255.174.156) by
 DM6PR12MB3353.namprd12.prod.outlook.com (20.178.31.224) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2199.21; Fri, 30 Aug 2019 20:08:17 +0000
Received: from DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::3d2a:29d4:df8:4d5]) by DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::3d2a:29d4:df8:4d5%2]) with mapi id 15.20.2199.021; Fri, 30 Aug 2019
 20:08:17 +0000
From: "Kuehling, Felix" <Felix.Kuehling@amd.com>
To: "Grodzovsky, Andrey" <Andrey.Grodzovsky@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH v3 1/3] drm/amdgpu: Fix bugs in amdgpu_device_gpu_recover
 in XGMI case.
Thread-Topic: [PATCH v3 1/3] drm/amdgpu: Fix bugs in amdgpu_device_gpu_recover
 in XGMI case.
Thread-Index: AQHVX1F/Nf/Y0zw2A0mvmMMTUx7kDacUHq2A
Date: Fri, 30 Aug 2019 20:08:17 +0000
Message-ID: <661d2e70-dc40-71c2-24b6-a6046688cdb4@amd.com>
References: <1567183153-11014-1-git-send-email-andrey.grodzovsky@amd.com>
In-Reply-To: <1567183153-11014-1-git-send-email-andrey.grodzovsky@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-clientproxiedby: YTXPR0101CA0024.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::37) To DM6PR12MB3947.namprd12.prod.outlook.com
 (2603:10b6:5:1cb::28)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0379d1af-e4a3-430c-326b-08d72d85cc03
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM6PR12MB3353; 
x-ms-traffictypediagnostic: DM6PR12MB3353:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR12MB33531CA18B92DC18FFA9CCE392BD0@DM6PR12MB3353.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 0145758B1D
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(136003)(366004)(39850400004)(396003)(346002)(189003)(199004)(53936002)(6116002)(54906003)(110136005)(86362001)(36756003)(6436002)(25786009)(6246003)(4326008)(5660300002)(71190400001)(31686004)(31696002)(58126008)(3846002)(99286004)(316002)(52116002)(66066001)(76176011)(65806001)(65956001)(53546011)(102836004)(2616005)(11346002)(446003)(26005)(81156014)(476003)(81166006)(186003)(486006)(8936002)(14454004)(66476007)(478600001)(305945005)(7736002)(71200400001)(386003)(6486002)(229853002)(2501003)(8676002)(14444005)(6512007)(256004)(64756008)(66946007)(2906002)(66556008)(6506007)(66446008);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3353;
 H:DM6PR12MB3947.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: GvbE0sjLmynmLUx3ZvP5THmcC4ptacfUGUSruc5WSjzhNQYolxrTZ2WXfA74lbV5pJRSkyIpVWuKjDZKmKDorE4mPbGckb+VIQNsceJUX0krbJGyCq9nm8uTJC0Svu6VfxO2KEfFc7h47zUuB5uNbk+L4DiAXWOb8MRnvBMqz2rqBr+Cxl9c+p2VNelEpjDv7TTtUb/DPQ+1Jwx5AIpYRytcd9EqKb3HsZ+pxD7BG5OvUcVFfQxjSZH3To+4MA0dQQyQUHB2EIIE3U2v4gKiA0QAskBotvWDqzsnQdL2ufGRac5zuT0KLMTtWT0fsPUQMZzhaLvkW69AIXoVDBvdOxTmWxhUvC8jm+ID76uRfh/yJfU4UpEe64kTY/3pu/a2EJsU90Xdhr8UifXepfwZe074VQCWGT/Yu0IVyO/7zfk=
Content-ID: <928F30FCFC420B4094A9050D52719FAD@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0379d1af-e4a3-430c-326b-08d72d85cc03
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Aug 2019 20:08:17.5584 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ijp+QMMz36pWxkgzDFpaI3mp6qksWrfmSyOdULTPbh+OGdjtqGSFHXcP+B+d59V3WYYwWGzGOEGZ1tXFmMEoZg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3353
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y6X6Nindb1zYrriL2AlEqsuh9GgnbZpPqkPC8WMfYEo=;
 b=jxI88dSH8nvzzy5l7JfG9h40FnUP11hGGj/BONtqi9jUp9lTfx3jrjiy28NeJhr7h8YilWXlD3n4llGrSpVm/EwaiIion2GnjFexbORdMrBKCV7QUWxsnaxFj6TN8HJpx2jghkSAnpUlmvWiW9G0mnGQVdddzfLOtQ6QJU1yhp0=
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
Cc: "alexdeucher@gmail.com" <alexdeucher@gmail.com>,
 "ckoenig.leichtzumerken@gmail.com" <ckoenig.leichtzumerken@gmail.com>, "Zhou1,
 Tao" <Tao.Zhou1@amd.com>, "Zhang, Hawking" <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gMjAxOS0wOC0zMCAxMjozOSBwLm0uLCBBbmRyZXkgR3JvZHpvdnNreSB3cm90ZToNCj4gSXNz
dWUgMToNCj4gSW4gIFhHTUkgY2FzZSBhbWRncHVfZGV2aWNlX2xvY2tfYWRldiBmb3Igb3RoZXIg
ZGV2aWNlcyBpbiBoaXZlDQo+IHdhcyBjYWxsZWQgdG8gbGF0ZSwgYWZ0ZXIgYWNjZXNzIHRvIHRo
ZWlyIHJlcHNlY3RpdmUgc2NoZWR1bGVycy4NCj4gU28gcmVsb2NhdGUgdGhlIGxvY2sgdG8gdGhl
IGJlZ2luaW5nIG9mIGFjY2Vzc2luZyB0aGUgb3RoZXIgZGV2cy4NCj4NCj4gSXNzdWUgMjoNCj4g
VXNpbmcgYW1kZ3B1X2RldmljZV9pcF9uZWVkX2Z1bGxfcmVzZXQgdG8gc3dpdGNoIHRoZSBkZXZp
Y2UgbGlzdCBmcm9tDQo+IGFsbCBkZXZpY2VzIGluIGhpdmUgdG8gdGhlIHNpbmdsZSAnbWFzdGVy
JyBkZXZpY2Ugd2hvIG93bnMgdGhpcyByZXNldA0KPiBjYWxsIGlzIHdyb25nIGJlY2F1c2Ugd2hl
biBzdG9wcGluZyBzY2hlZHVsZXJzIHdlIGl0ZXJhdGUgYWxsIHRoZSBkZXZpY2VzDQo+IGluIGhp
dmUgYnV0IHdoZW4gcmVzdGFydGluZyB3ZSB3aWxsIG9ubHkgcmVhY3RpdmF0ZSB0aGUgJ21hc3Rl
cicgZGV2aWNlLg0KPiBBbHNvLCBpbiBjYXNlIGFtZGdwdV9kZXZpY2VfcHJlX2FzaWNfcmVzZXQg
Y29ubGN1ZGVzIHRoYXQgZnVsbCByZXNldCBJUw0KPiBuZWVkZWQgd2UgdGhlbiBoYXZlIHRvIHN0
b3Agc2NoZWR1bGVycyBmb3IgYWxsIGRldmljZXMgaW4gaGl2ZSBhbmQgbm90DQo+IG9ubHkgdGhl
ICdtYXN0ZXInIGJ1dCB3aXRoIGFtZGdwdV9kZXZpY2VfaXBfbmVlZF9mdWxsX3Jlc2V0ICB3ZQ0K
PiBhbHJlYWR5IG1pc3NlZCB0aGUgb3Bwcm90dW5pdHkgZG8gdG8gc28uIFNvIGp1c3QgcmVtb3Zl
IHRoaXMgbG9naWMgYW5kDQo+IGFsd2F5cyBzdG9wIGFuZCBzdGFydCBhbGwgc2NoZWR1bGVycyBm
b3IgYWxsIGRldmljZXMgaW4gaGl2ZS4NCj4NCj4gQWxzbyBtaW5vciBjbGVhbnVwIGFuZCBwcmlu
dCBmaXguDQo+DQo+IFNpZ25lZC1vZmYtYnk6IEFuZHJleSBHcm9kem92c2t5IDxhbmRyZXkuZ3Jv
ZHpvdnNreUBhbWQuY29tPg0KDQpNaW5vciBuaXQtcGljayBpbmxpbmUuIFdpdGggdGhhdCBmaXhl
ZCB0aGlzIHBhdGNoIGlzIEFja2VkLWJ5OiBGZWxpeCANCkt1ZWhsaW5nIDxGZWxpeC5LdWVobGlu
Z0BhbWQuY29tPg0KDQoNCj4gLS0tDQo+ICAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1k
Z3B1X2RldmljZS5jIHwgMjUgKysrKysrKysrKystLS0tLS0tLS0tLS0tLQ0KPiAgIDEgZmlsZSBj
aGFuZ2VkLCAxMSBpbnNlcnRpb25zKCspLCAxNCBkZWxldGlvbnMoLSkNCj4NCj4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kZXZpY2UuYyBiL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kZXZpY2UuYw0KPiBpbmRleCBhNWRhY2NjLi4xOWY2
NjI0IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGV2
aWNlLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RldmljZS5j
DQo+IEBAIC0zODE0LDE1ICszODE0LDE2IEBAIGludCBhbWRncHVfZGV2aWNlX2dwdV9yZWNvdmVy
KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LA0KPiAgIAkJZGV2aWNlX2xpc3RfaGFuZGxlID0g
JmRldmljZV9saXN0Ow0KPiAgIAl9DQo+ICAgDQo+IC0JLyoNCj4gLQkgKiBNYXJrIHRoZXNlIEFT
SUNzIHRvIGJlIHJlc2V0ZWQgYXMgdW50cmFja2VkIGZpcnN0DQo+IC0JICogQW5kIGFkZCB0aGVt
IGJhY2sgYWZ0ZXIgcmVzZXQgY29tcGxldGVkDQo+IC0JICovDQo+IC0JbGlzdF9mb3JfZWFjaF9l
bnRyeSh0bXBfYWRldiwgZGV2aWNlX2xpc3RfaGFuZGxlLCBnbWMueGdtaS5oZWFkKQ0KPiAtCQlh
bWRncHVfdW5yZWdpc3Rlcl9ncHVfaW5zdGFuY2UodG1wX2FkZXYpOw0KPiAtDQo+ICAgCS8qIGJs
b2NrIGFsbCBzY2hlZHVsZXJzIGFuZCByZXNldCBnaXZlbiBqb2IncyByaW5nICovDQo+ICAgCWxp
c3RfZm9yX2VhY2hfZW50cnkodG1wX2FkZXYsIGRldmljZV9saXN0X2hhbmRsZSwgZ21jLnhnbWku
aGVhZCkgew0KPiArCQlpZiAodG1wX2FkZXYgIT0gYWRldikNCj4gKwkJCWFtZGdwdV9kZXZpY2Vf
bG9ja19hZGV2KHRtcF9hZGV2LCBmYWxzZSk7DQo+ICsJCS8qDQo+ICsJCSAqIE1hcmsgdGhlc2Ug
QVNJQ3MgdG8gYmUgcmVzZXRlZCBhcyB1bnRyYWNrZWQgZmlyc3QNCj4gKwkJICogQW5kIGFkZCB0
aGVtIGJhY2sgYWZ0ZXIgcmVzZXQgY29tcGxldGVkDQo+ICsJCSAqLw0KPiArCQlhbWRncHVfdW5y
ZWdpc3Rlcl9ncHVfaW5zdGFuY2UodG1wX2FkZXYpOw0KPiArDQo+ICAgCQkvKiBkaXNhYmxlIHJh
cyBvbiBBTEwgSVBzICovDQo+ICAgCQlpZiAoYW1kZ3B1X2RldmljZV9pcF9uZWVkX2Z1bGxfcmVz
ZXQodG1wX2FkZXYpKQ0KPiAgIAkJCWFtZGdwdV9yYXNfc3VzcGVuZCh0bXBfYWRldik7DQo+IEBA
IC0zODQ4LDkgKzM4NDksNiBAQCBpbnQgYW1kZ3B1X2RldmljZV9ncHVfcmVjb3ZlcihzdHJ1Y3Qg
YW1kZ3B1X2RldmljZSAqYWRldiwNCj4gICAJICAgIGRtYV9mZW5jZV9pc19zaWduYWxlZChqb2It
PmJhc2Uuc19mZW5jZS0+cGFyZW50KSkNCj4gICAJCWpvYl9zaWduYWxlZCA9IHRydWU7DQo+ICAg
DQo+IC0JaWYgKCFhbWRncHVfZGV2aWNlX2lwX25lZWRfZnVsbF9yZXNldChhZGV2KSkNCj4gLQkJ
ZGV2aWNlX2xpc3RfaGFuZGxlID0gJmRldmljZV9saXN0Ow0KPiAtDQo+ICAgCWlmIChqb2Jfc2ln
bmFsZWQpIHsNCj4gICAJCWRldl9pbmZvKGFkZXYtPmRldiwgIkd1aWx0eSBqb2IgYWxyZWFkeSBz
aWduYWxlZCwgc2tpcHBpbmcgSFcgcmVzZXQiKTsNCj4gICAJCWdvdG8gc2tpcF9od19yZXNldDsN
Cj4gQEAgLTM4NjksMTAgKzM4NjcsOSBAQCBpbnQgYW1kZ3B1X2RldmljZV9ncHVfcmVjb3Zlcihz
dHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwNCj4gICByZXRyeToJLyogUmVzdCBvZiBhZGV2cyBw
cmUgYXNpYyByZXNldCBmcm9tIFhHTUkgaGl2ZS4gKi8NCj4gICAJbGlzdF9mb3JfZWFjaF9lbnRy
eSh0bXBfYWRldiwgZGV2aWNlX2xpc3RfaGFuZGxlLCBnbWMueGdtaS5oZWFkKSB7DQo+ICAgDQo+
IC0JCWlmICh0bXBfYWRldiA9PSBhZGV2KQ0KPiArCQlpZih0bXBfYWRldiA9PSBhZGV2KQ0KDQpU
aGUgc3BhY2UgYmVmb3JlICggd2FzIGNvcnJlY3QgY29kaW5nIHN0eWxlLiBUaGlzIHdpbGwgdHJp
Z2dlciBhIA0KY2hlY2twYXRjaCBlcnJvciBvciB3YXJuaW5nLg0KDQoNCj4gICAJCQljb250aW51
ZTsNCj4gICANCj4gLQkJYW1kZ3B1X2RldmljZV9sb2NrX2FkZXYodG1wX2FkZXYsIGZhbHNlKTsN
Cj4gICAJCXIgPSBhbWRncHVfZGV2aWNlX3ByZV9hc2ljX3Jlc2V0KHRtcF9hZGV2LA0KPiAgIAkJ
CQkJCSBOVUxMLA0KPiAgIAkJCQkJCSAmbmVlZF9mdWxsX3Jlc2V0KTsNCj4gQEAgLTM5MjEsMTAg
KzM5MTgsMTAgQEAgaW50IGFtZGdwdV9kZXZpY2VfZ3B1X3JlY292ZXIoc3RydWN0IGFtZGdwdV9k
ZXZpY2UgKmFkZXYsDQo+ICAgDQo+ICAgCQlpZiAocikgew0KPiAgIAkJCS8qIGJhZCBuZXdzLCBo
b3cgdG8gdGVsbCBpdCB0byB1c2Vyc3BhY2UgPyAqLw0KPiAtCQkJZGV2X2luZm8odG1wX2FkZXYt
PmRldiwgIkdQVSByZXNldCglZCkgZmFpbGVkXG4iLCBhdG9taWNfcmVhZCgmYWRldi0+Z3B1X3Jl
c2V0X2NvdW50ZXIpKTsNCj4gKwkJCWRldl9pbmZvKHRtcF9hZGV2LT5kZXYsICJHUFUgcmVzZXQo
JWQpIGZhaWxlZFxuIiwgYXRvbWljX3JlYWQoJnRtcF9hZGV2LT5ncHVfcmVzZXRfY291bnRlcikp
Ow0KPiAgIAkJCWFtZGdwdV92Zl9lcnJvcl9wdXQodG1wX2FkZXYsIEFNREdJTV9FUlJPUl9WRl9H
UFVfUkVTRVRfRkFJTCwgMCwgcik7DQo+ICAgCQl9IGVsc2Ugew0KPiAtCQkJZGV2X2luZm8odG1w
X2FkZXYtPmRldiwgIkdQVSByZXNldCglZCkgc3VjY2VlZGVkIVxuIiwgYXRvbWljX3JlYWQoJmFk
ZXYtPmdwdV9yZXNldF9jb3VudGVyKSk7DQo+ICsJCQlkZXZfaW5mbyh0bXBfYWRldi0+ZGV2LCAi
R1BVIHJlc2V0KCVkKSBzdWNjZWVkZWQhXG4iLCBhdG9taWNfcmVhZCgmdG1wX2FkZXYtPmdwdV9y
ZXNldF9jb3VudGVyKSk7DQo+ICAgCQl9DQo+ICAgDQo+ICAgCQlhbWRncHVfZGV2aWNlX3VubG9j
a19hZGV2KHRtcF9hZGV2KTsNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdm
eA==
