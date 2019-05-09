Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C684818AC5
	for <lists+amd-gfx@lfdr.de>; Thu,  9 May 2019 15:33:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1327089C82;
	Thu,  9 May 2019 13:33:41 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770075.outbound.protection.outlook.com [40.107.77.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27EC089C82
 for <amd-gfx@lists.freedesktop.org>; Thu,  9 May 2019 13:33:39 +0000 (UTC)
Received: from DM5PR1201MB0155.namprd12.prod.outlook.com (10.174.106.148) by
 DM5PR1201MB0153.namprd12.prod.outlook.com (10.174.107.147) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1856.11; Thu, 9 May 2019 13:33:36 +0000
Received: from DM5PR1201MB0155.namprd12.prod.outlook.com
 ([fe80::a808:b010:54b6:7125]) by DM5PR1201MB0155.namprd12.prod.outlook.com
 ([fe80::a808:b010:54b6:7125%11]) with mapi id 15.20.1856.012; Thu, 9 May 2019
 13:33:35 +0000
From: "Yang, Philip" <Philip.Yang@amd.com>
To: "Kuehling, Felix" <Felix.Kuehling@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 1/1] drm/amdgpu: Improve error handling for HMM
Thread-Topic: [PATCH 1/1] drm/amdgpu: Improve error handling for HMM
Thread-Index: AQHVBR8mfWFt67IOikqZ0tcF6tC5eKZizVmA
Date: Thu, 9 May 2019 13:33:35 +0000
Message-ID: <502904df-f52e-7ef5-ece2-60e0afcd7305@amd.com>
References: <20190507215202.14616-1-Felix.Kuehling@amd.com>
In-Reply-To: <20190507215202.14616-1-Felix.Kuehling@amd.com>
Accept-Language: en-ZA, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTXPR0101CA0007.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::20) To DM5PR1201MB0155.namprd12.prod.outlook.com
 (2603:10b6:4:55::20)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.55.251]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 408112bc-bf01-428a-23ea-08d6d482efc6
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:DM5PR1201MB0153; 
x-ms-traffictypediagnostic: DM5PR1201MB0153:
x-microsoft-antispam-prvs: <DM5PR1201MB015309912D837606E21CF412E6330@DM5PR1201MB0153.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2449;
x-forefront-prvs: 003245E729
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(39860400002)(376002)(396003)(346002)(366004)(136003)(189003)(199004)(316002)(25786009)(186003)(76176011)(256004)(476003)(486006)(99286004)(81166006)(11346002)(2616005)(6486002)(102836004)(110136005)(6436002)(26005)(81156014)(229853002)(71200400001)(71190400001)(478600001)(446003)(64756008)(73956011)(6506007)(5660300002)(66476007)(66446008)(53546011)(66946007)(66556008)(386003)(31686004)(52116002)(68736007)(14454004)(2501003)(6246003)(72206003)(31696002)(36756003)(86362001)(53936002)(305945005)(66066001)(6512007)(8676002)(2906002)(7736002)(6116002)(3846002)(8936002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR1201MB0153;
 H:DM5PR1201MB0155.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 5GJAUxRQHjCwJcdIcRfIUHj9U2EkYbvFvXSZy4fYU36m9JgfR0AgkQpS7zYVoup7NhlbLJQKXKYP57F2l5yOpajv+E0r3F4TEsN8tpEMPhwidx/0RkQNB34E3kSRpYPJX56N6FOnHqiyorEPFDfohLGGULGg7zZNPTOjXUJH94MYDg6VHpZhEuRcDmB0gUqcU7WxNw1or8vM+9+1uU+C/SNOH8F3E2/DuTYrFvhj8LyKUl5UXQZq/WXFpxzykxfgxyWkBIjYw2wZauhKZmMPAI5fqO6CtbHoOFxGf5kTe8EmVqGh1MHWTjixs25UjJTZKTBbu81wsJxVyfPDNsjuxDDaBqOJGKbQiD3GB0hoRKn3EleIXi+YHcHrP4XQ+7fwA7UODiodZEWW+8KgsCGg1y56KW2Dycyop9C/h7ZbEVc=
Content-ID: <C38C07E36A786E41B4D611B13C247EFA@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 408112bc-bf01-428a-23ea-08d6d482efc6
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 May 2019 13:33:35.7324 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1201MB0153
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amd-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2EE79/j8D1rX+SjOzA3EUpf+Q6/CJel2Eas0KkvTAu0=;
 b=N7avdRdvQe19PNFb/nJsZiaxw29f5urXEXH887Y8yXbtxpV9+1lvWqSho0u8yFd2bLm5TYtLRN6iTmqKIduo91UYVqSzLs6x/mQ2Xwc8Fk5tNV1qPAaREqCRw8GioSSZQpBrlKsSAcWb+PEOfrqWkoMhyOyunVERrqjN1sH0w/4=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Philip.Yang@amd.com; 
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

T24gMjAxOS0wNS0wNyA1OjUyIHAubS4sIEt1ZWhsaW5nLCBGZWxpeCB3cm90ZToNCj4gVXNlIHVu
c2lnbmVkIGxvbmcgZm9yIG51bWJlciBvZiBwYWdlcy4NCj4gDQo+IENoZWNrIHRoYXQgcGZucyBh
cmUgdmFsaWQgYWZ0ZXIgaG1tX3ZtYV9mYXVsdC4gSWYgdGhleSBhcmUgbm90LA0KPiByZXR1cm4g
YW4gZXJyb3IgaW5zdGVhZCBvZiBjb250aW51aW5nIHdpdGggaW52YWxpZCBwYWdlIHBvaW50ZXJz
IGFuZA0KPiBQVEVzLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogRmVsaXggS3VlaGxpbmcgPEZlbGl4
Lkt1ZWhsaW5nQGFtZC5jb20+DQoNClJldmlld2VkLWJ5OiBQaGlsaXAgWWFuZyA8UGhpbGlwLllh
bmdAYW1kLmNvbT4NCg0KPiAtLS0NCj4gICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRn
cHVfdHRtLmMgfCAyMiArKysrKysrKysrKysrKysrKystLS0tDQo+ICAgMSBmaWxlIGNoYW5nZWQs
IDE4IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3R0bS5jIGIvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvYW1kZ3B1X3R0bS5jDQo+IGluZGV4IGMxNDE5ODczN2RjZC4uMzhjZTExZTMzOGUw
IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdHRtLmMN
Cj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3R0bS5jDQo+IEBAIC03
MzQsMTAgKzczNCwxMSBAQCBpbnQgYW1kZ3B1X3R0bV90dF9nZXRfdXNlcl9wYWdlcyhzdHJ1Y3Qg
dHRtX3R0ICp0dG0sIHN0cnVjdCBwYWdlICoqcGFnZXMpDQo+ICAgCXN0cnVjdCBtbV9zdHJ1Y3Qg
Km1tID0gZ3R0LT51c2VydGFzay0+bW07DQo+ICAgCXVuc2lnbmVkIGxvbmcgc3RhcnQgPSBndHQt
PnVzZXJwdHI7DQo+ICAgCXVuc2lnbmVkIGxvbmcgZW5kID0gc3RhcnQgKyB0dG0tPm51bV9wYWdl
cyAqIFBBR0VfU0laRTsNCj4gLQlzdHJ1Y3QgaG1tX3JhbmdlICpyYW5nZXM7DQo+ICAgCXN0cnVj
dCB2bV9hcmVhX3N0cnVjdCAqdm1hID0gTlVMTCwgKnZtYXNbTUFYX05SX1ZNQVNdOw0KPiArCXN0
cnVjdCBobW1fcmFuZ2UgKnJhbmdlczsNCj4gKwl1bnNpZ25lZCBsb25nIG5yX3BhZ2VzLCBpOw0K
PiAgIAl1aW50NjRfdCAqcGZucywgZjsNCj4gLQlpbnQgciA9IDAsIGksIG5yX3BhZ2VzOw0KPiAr
CWludCByID0gMDsNCj4gICANCj4gICAJaWYgKCFtbSkgLyogSGFwcGVucyBkdXJpbmcgcHJvY2Vz
cyBzaHV0ZG93biAqLw0KPiAgIAkJcmV0dXJuIC1FU1JDSDsNCj4gQEAgLTgxMyw4ICs4MTQsMTQg
QEAgaW50IGFtZGdwdV90dG1fdHRfZ2V0X3VzZXJfcGFnZXMoc3RydWN0IHR0bV90dCAqdHRtLCBz
dHJ1Y3QgcGFnZSAqKnBhZ2VzKQ0KPiAgIA0KPiAgIAl1cF9yZWFkKCZtbS0+bW1hcF9zZW0pOw0K
PiAgIA0KPiAtCWZvciAoaSA9IDA7IGkgPCB0dG0tPm51bV9wYWdlczsgaSsrKQ0KPiArCWZvciAo
aSA9IDA7IGkgPCB0dG0tPm51bV9wYWdlczsgaSsrKSB7DQo+ICAgCQlwYWdlc1tpXSA9IGhtbV9w
Zm5fdG9fcGFnZSgmcmFuZ2VzWzBdLCBwZm5zW2ldKTsNCj4gKwkJaWYgKCFwYWdlc1tpXSkgew0K
PiArCQkJcHJfZXJyKCJQYWdlIGZhdWx0IGZhaWxlZCBmb3IgcGZuWyVsdV0gPSAweCVsbHhcbiIs
DQo+ICsJCQkgICAgICAgaSwgcGZuc1tpXSk7DQo+ICsJCQlnb3RvIG91dF9pbnZhbGlkX3BmbjsN
Cj4gKwkJfQ0KPiArCX0NCj4gICAJZ3R0LT5yYW5nZXMgPSByYW5nZXM7DQo+ICAgDQo+ICAgCXJl
dHVybiAwOw0KPiBAQCAtODI3LDYgKzgzNCwxMyBAQCBpbnQgYW1kZ3B1X3R0bV90dF9nZXRfdXNl
cl9wYWdlcyhzdHJ1Y3QgdHRtX3R0ICp0dG0sIHN0cnVjdCBwYWdlICoqcGFnZXMpDQo+ICAgCXVw
X3JlYWQoJm1tLT5tbWFwX3NlbSk7DQo+ICAgDQo+ICAgCXJldHVybiByOw0KPiArDQo+ICtvdXRf
aW52YWxpZF9wZm46DQo+ICsJZm9yIChpID0gMDsgaSA8IGd0dC0+bnJfcmFuZ2VzOyBpKyspDQo+
ICsJCWhtbV92bWFfcmFuZ2VfZG9uZSgmcmFuZ2VzW2ldKTsNCj4gKwlrdmZyZWUocGZucyk7DQo+
ICsJa3ZmcmVlKHJhbmdlcyk7DQo+ICsJcmV0dXJuIC1FTk9NRU07DQo+ICAgfQ0KPiAgIA0KPiAg
IC8qKg0KPiBAQCAtODcxLDcgKzg4NSw3IEBAIGJvb2wgYW1kZ3B1X3R0bV90dF9nZXRfdXNlcl9w
YWdlc19kb25lKHN0cnVjdCB0dG1fdHQgKnR0bSkNCj4gICAgKi8NCj4gICB2b2lkIGFtZGdwdV90
dG1fdHRfc2V0X3VzZXJfcGFnZXMoc3RydWN0IHR0bV90dCAqdHRtLCBzdHJ1Y3QgcGFnZSAqKnBh
Z2VzKQ0KPiAgIHsNCj4gLQl1bnNpZ25lZCBpOw0KPiArCXVuc2lnbmVkIGxvbmcgaTsNCj4gICAN
Cj4gICAJZm9yIChpID0gMDsgaSA8IHR0bS0+bnVtX3BhZ2VzOyArK2kpDQo+ICAgCQl0dG0tPnBh
Z2VzW2ldID0gcGFnZXMgPyBwYWdlc1tpXSA6IE5VTEw7DQo+IA0KX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdm
eEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9hbWQtZ2Z4
