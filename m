Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DAE0F3804D
	for <lists+amd-gfx@lfdr.de>; Fri,  7 Jun 2019 00:08:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EBD9899B7;
	Thu,  6 Jun 2019 22:08:49 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-eopbgr760079.outbound.protection.outlook.com [40.107.76.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF2F7899B7
 for <amd-gfx@lists.freedesktop.org>; Thu,  6 Jun 2019 22:08:47 +0000 (UTC)
Received: from DM6PR12MB3947.namprd12.prod.outlook.com (10.255.174.156) by
 DM6PR12MB3386.namprd12.prod.outlook.com (20.178.198.81) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1965.14; Thu, 6 Jun 2019 22:08:46 +0000
Received: from DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::5964:8c3c:1b5b:c480]) by DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::5964:8c3c:1b5b:c480%2]) with mapi id 15.20.1965.011; Thu, 6 Jun 2019
 22:08:46 +0000
From: "Kuehling, Felix" <Felix.Kuehling@amd.com>
To: "Zeng, Oak" <Oak.Zeng@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/amdkfd: Initialize dqm earlier
Thread-Topic: [PATCH] drm/amdkfd: Initialize dqm earlier
Thread-Index: AQHVHLIBFJGLVzlZGUi5mMfQcpn2SqaPL2sA
Date: Thu, 6 Jun 2019 22:08:46 +0000
Message-ID: <b3a5c8d3-394f-d6a1-dec3-fb42d0b9d077@amd.com>
References: <1559857887-7096-1-git-send-email-Oak.Zeng@amd.com>
In-Reply-To: <1559857887-7096-1-git-send-email-Oak.Zeng@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
x-clientproxiedby: YTBPR01CA0032.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:14::45) To DM6PR12MB3947.namprd12.prod.outlook.com
 (2603:10b6:5:1cb::28)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d9c3789b-8d71-41d2-76ea-08d6eacb8b76
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM6PR12MB3386; 
x-ms-traffictypediagnostic: DM6PR12MB3386:
x-microsoft-antispam-prvs: <DM6PR12MB33864A20075B1065621E83DB92170@DM6PR12MB3386.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 00603B7EEF
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(396003)(136003)(376002)(346002)(39860400002)(366004)(199004)(189003)(36756003)(65806001)(65956001)(99286004)(66066001)(81156014)(2906002)(52116002)(81166006)(8676002)(5660300002)(53936002)(6116002)(72206003)(478600001)(25786009)(3846002)(476003)(316002)(486006)(14454004)(31696002)(53546011)(386003)(6506007)(8936002)(86362001)(305945005)(102836004)(7736002)(229853002)(64126003)(68736007)(64756008)(66446008)(76176011)(446003)(73956011)(66946007)(66556008)(256004)(6512007)(186003)(6246003)(110136005)(58126008)(71190400001)(2616005)(31686004)(65826007)(2501003)(26005)(6436002)(71200400001)(6486002)(66476007)(11346002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3386;
 H:DM6PR12MB3947.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: WB23INH0TfNBW13SDMzjU+pB1827YSKZ3Xy82AHHnfN6poQloEvwGL308yLu8CC9Z7Z+p33gZ+9Ih30w8EfnAYhxG/9wK+4v/X93IiK0AfztZCfBG0xNN10XHu1ig0a5h6Kj8Iwy3T0+LPL852ubnQtPHbT8CAcXR42VwP7pZdNXh3cM9qDdCK3LE7jq9fa7Pa8iaYRfw/1UIqZcMQfdbBCHN66xstsg14dK5jSv34GFjOl4WNZpXuN3tVqjwQ8CEIpmyryaAZhb+Mej3fsgrZh56gHkXSdwFYTVLvwCe6+Rcg8bi9DGHSSZkuRqA+YsLZX1WaHoxcePP9ZhZTFGhOqHicMIn1m7/Fy+TBl+PZzQRLrUUbnXnFU9faISRW/F6b83EICzcMBMq87WmsYY/28MsugMdVm1LG0D74rl+rQ=
Content-ID: <84098666EA5A1F4481B7C802CC6D8DF9@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d9c3789b-8d71-41d2-76ea-08d6eacb8b76
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jun 2019 22:08:46.0560 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fkuehlin@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3386
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TJM2bEd7bkoWjrn7Co6JOtL4f0B9ZpAtQ4w827uZkmk=;
 b=Vn6JbAiKVky1Zl1x+L2D9IU/kwPPUs/Z9QocZanIKssfjUml/IO3rE3BD3Uh6GYZJXAXWvkoJJ3Me9jBntwGnPhYQGXsIIuKs9PtwiQxDtJaImK3DJIEQsOH6RanlPEAp3uOwT65XTwwuveqSEG+jmTChTP6+ijfBSMXgIIqL9k=
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

T24gMjAxOS0wNi0wNiA1OjUxIHAubS4sIFplbmcsIE9hayB3cm90ZToNCj4gZHFtIGlzIHJlZmVy
ZW5jZWQgaW4gZnVuY3Rpb24ga2ZkX3RvcGxvZ3lfYWRkX2RldmljZS4NCj4gTW92ZSBkcW0gaW5p
dGlhbGl6YXRpb24gdXAgdG8gYXZvaWQgTlVMTCBwb2ludGVyIHJlZmVyZW5jZS4NCg0KVGhpcyBh
ZGRyZXNzZXMgYSBwcmV0dHkgdW5saWtlbHkgcmFjZSBjb25kaXRpb24gd2hlcmUgc29tZW9uZSBs
b29rcyBhdCANCi9zeXMva2VybmVsL2RlYnVnL2tmZC9ocWRzIGR1cmluZyB0aGUgZGV2aWNlIGlu
aXRpYWxpemF0aW9uLg0KDQpXZSBhZGQgZGV2aWNlcyBkbyB0aGUgdG9wb2xvZ3kgYmVmb3JlIHRo
ZWlyIGluaXRpYWxpemF0aW9uIGlzIA0Kc3VjY2Vzc2Z1bGx5IGNvbXBsZXRlZC4gSWYgaXQgZmFp
bHMsIHdlIHJlbW92ZSB0aGUgZGV2aWNlIGFnYWluLiBIYXZpbmcgDQpkZXZpY2VzIGluIHRoZSB0
b3BvbG9neSB0aGF0IGFyZSBub3QgY29tcGxldGVseSBpbml0aWFsaXplZCB5ZXQgc2VlbXMgdG8g
DQpiZSB0aGUgcmVhbCBpc3N1ZS4gQSBjbGVhbmVyIHNvbHV0aW9uIHdvdWxkIG1vdmUgDQprZmRf
dG9wb2dsb2d5X2FkZF9kZXZpY2UgdG8gdGhlIGVuZCBvZiBrZ2Qya2ZkX2RldmljZV9pbml0LCBz
byB0aGF0IHdlIA0Kb25seSBhZGQgYSBkZXZpY2UgdG8gdGhlIHRvcG9sb2d5IGFmdGVyIHRoZXkg
YXJlIHN1Y2Nlc3NmdWxseSBhbmQgDQpjb21wbGV0ZWx5IGluaXRpYWxpemVkLiBOb3Qgc3VyZSBp
ZiB0aGVyZSBhcmUgYW55IGRlcGVuZGVuY2llcyBpbiB0aGUgDQppbml0IHNlcXVlbmNlIHRoYXQg
d291bGQgYmUgYnJva2VuIGJ5IHRoaXMsIHRob3VnaC4NCg0KUmVnYXJkcywNCiDCoCBGZWxpeA0K
DQoNCj4NCj4gQ2hhbmdlLUlkOiBJZDZjYjI1NDFhZjEyOTgyNmI3NjIxY2VhYThlMDZlNjM4Yzdi
YjEyMg0KPiBTaWduZWQtb2ZmLWJ5OiBPYWsgWmVuZyA8T2FrLlplbmdAYW1kLmNvbT4NCj4gLS0t
DQo+ICAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX2RldmljZS5jIHwgMTYgKysrKysr
KystLS0tLS0tLQ0KPiAgIDEgZmlsZSBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKyksIDggZGVsZXRp
b25zKC0pDQo+DQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRf
ZGV2aWNlLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfZGV2aWNlLmMNCj4gaW5k
ZXggOWQxYjAyNi4uZTdlMjRmZSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRrZmQva2ZkX2RldmljZS5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tm
ZF9kZXZpY2UuYw0KPiBAQCAtNjAzLDYgKzYwMywxMiBAQCBib29sIGtnZDJrZmRfZGV2aWNlX2lu
aXQoc3RydWN0IGtmZF9kZXYgKmtmZCwNCj4gICAJaWYgKGtmZC0+a2ZkMmtnZC0+Z2V0X2hpdmVf
aWQpDQo+ICAgCQlrZmQtPmhpdmVfaWQgPSBrZmQtPmtmZDJrZ2QtPmdldF9oaXZlX2lkKGtmZC0+
a2dkKTsNCj4gICANCj4gKwlrZmQtPmRxbSA9IGRldmljZV9xdWV1ZV9tYW5hZ2VyX2luaXQoa2Zk
KTsNCj4gKwlpZiAoIWtmZC0+ZHFtKSB7DQo+ICsJCWRldl9lcnIoa2ZkX2RldmljZSwgIkVycm9y
IGluaXRpYWxpemluZyBxdWV1ZSBtYW5hZ2VyXG4iKTsNCj4gKwkJZ290byBkZXZpY2VfcXVldWVf
bWFuYWdlcl9lcnJvcjsNCj4gKwl9DQo+ICsNCj4gICAJaWYgKGtmZF90b3BvbG9neV9hZGRfZGV2
aWNlKGtmZCkpIHsNCj4gICAJCWRldl9lcnIoa2ZkX2RldmljZSwgIkVycm9yIGFkZGluZyBkZXZp
Y2UgdG8gdG9wb2xvZ3lcbiIpOw0KPiAgIAkJZ290byBrZmRfdG9wb2xvZ3lfYWRkX2RldmljZV9l
cnJvcjsNCj4gQEAgLTYxMywxMiArNjE5LDYgQEAgYm9vbCBrZ2Qya2ZkX2RldmljZV9pbml0KHN0
cnVjdCBrZmRfZGV2ICprZmQsDQo+ICAgCQlnb3RvIGtmZF9pbnRlcnJ1cHRfZXJyb3I7DQo+ICAg
CX0NCj4gICANCj4gLQlrZmQtPmRxbSA9IGRldmljZV9xdWV1ZV9tYW5hZ2VyX2luaXQoa2ZkKTsN
Cj4gLQlpZiAoIWtmZC0+ZHFtKSB7DQo+IC0JCWRldl9lcnIoa2ZkX2RldmljZSwgIkVycm9yIGlu
aXRpYWxpemluZyBxdWV1ZSBtYW5hZ2VyXG4iKTsNCj4gLQkJZ290byBkZXZpY2VfcXVldWVfbWFu
YWdlcl9lcnJvcjsNCj4gLQl9DQo+IC0NCj4gICAJaWYgKGtmZF9pb21tdV9kZXZpY2VfaW5pdChr
ZmQpKSB7DQo+ICAgCQlkZXZfZXJyKGtmZF9kZXZpY2UsICJFcnJvciBpbml0aWFsaXppbmcgaW9t
bXV2MlxuIik7DQo+ICAgCQlnb3RvIGRldmljZV9pb21tdV9lcnJvcjsNCj4gQEAgLTY0MiwxMiAr
NjQyLDEyIEBAIGJvb2wga2dkMmtmZF9kZXZpY2VfaW5pdChzdHJ1Y3Qga2ZkX2RldiAqa2ZkLA0K
PiAgIA0KPiAgIGtmZF9yZXN1bWVfZXJyb3I6DQo+ICAgZGV2aWNlX2lvbW11X2Vycm9yOg0KPiAt
CWRldmljZV9xdWV1ZV9tYW5hZ2VyX3VuaW5pdChrZmQtPmRxbSk7DQo+IC1kZXZpY2VfcXVldWVf
bWFuYWdlcl9lcnJvcjoNCj4gICAJa2ZkX2ludGVycnVwdF9leGl0KGtmZCk7DQo+ICAga2ZkX2lu
dGVycnVwdF9lcnJvcjoNCj4gICAJa2ZkX3RvcG9sb2d5X3JlbW92ZV9kZXZpY2Uoa2ZkKTsNCj4g
ICBrZmRfdG9wb2xvZ3lfYWRkX2RldmljZV9lcnJvcjoNCj4gKwlkZXZpY2VfcXVldWVfbWFuYWdl
cl91bmluaXQoa2ZkLT5kcW0pOw0KPiArZGV2aWNlX3F1ZXVlX21hbmFnZXJfZXJyb3I6DQo+ICAg
CWtmZF9kb29yYmVsbF9maW5pKGtmZCk7DQo+ICAga2ZkX2Rvb3JiZWxsX2Vycm9yOg0KPiAgIAlr
ZmRfZ3R0X3NhX2Zpbmkoa2ZkKTsNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1k
LWdmeA==
