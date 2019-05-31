Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F25231470
	for <lists+amd-gfx@lfdr.de>; Fri, 31 May 2019 20:11:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEB8C89739;
	Fri, 31 May 2019 18:11:49 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr740051.outbound.protection.outlook.com [40.107.74.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BC7089739
 for <amd-gfx@lists.freedesktop.org>; Fri, 31 May 2019 18:11:49 +0000 (UTC)
Received: from CY4PR1201MB0230.namprd12.prod.outlook.com (10.172.79.7) by
 CY4PR1201MB2470.namprd12.prod.outlook.com (10.172.116.144) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1922.20; Fri, 31 May 2019 18:11:46 +0000
Received: from CY4PR1201MB0230.namprd12.prod.outlook.com
 ([fe80::7500:b13:ffcb:f9e3]) by CY4PR1201MB0230.namprd12.prod.outlook.com
 ([fe80::7500:b13:ffcb:f9e3%10]) with mapi id 15.20.1922.021; Fri, 31 May 2019
 18:11:46 +0000
From: Harry Wentland <hwentlan@amd.com>
To: "Kazlauskas, Nicholas" <Nicholas.Kazlauskas@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/amd/display: Don't set mode_changed=false if the
 stream was removed
Thread-Topic: [PATCH] drm/amd/display: Don't set mode_changed=false if the
 stream was removed
Thread-Index: AQHVFyET3bZeuO4TVke9fG5/Q317FKaFijAA
Date: Fri, 31 May 2019 18:11:46 +0000
Message-ID: <6289eb66-3382-0fa3-7f25-cb1b4dac6f16@amd.com>
References: <20190530195114.2555-1-nicholas.kazlauskas@amd.com>
In-Reply-To: <20190530195114.2555-1-nicholas.kazlauskas@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.250]
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
x-clientproxiedby: YTOPR0101CA0053.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:14::30) To CY4PR1201MB0230.namprd12.prod.outlook.com
 (2603:10b6:910:1e::7)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4e9ec097-137a-48a8-6c92-08d6e5f37186
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:CY4PR1201MB2470; 
x-ms-traffictypediagnostic: CY4PR1201MB2470:
x-microsoft-antispam-prvs: <CY4PR1201MB247089F96F335DD1E3975A0F8C190@CY4PR1201MB2470.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1284;
x-forefront-prvs: 00540983E2
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(346002)(366004)(396003)(39860400002)(376002)(136003)(189003)(199004)(6116002)(2501003)(65826007)(66556008)(3846002)(256004)(99286004)(66446008)(66476007)(229853002)(8676002)(110136005)(68736007)(2906002)(58126008)(8936002)(14444005)(54906003)(81166006)(71190400001)(305945005)(81156014)(7736002)(71200400001)(31696002)(186003)(486006)(64126003)(6246003)(72206003)(53936002)(66066001)(476003)(66946007)(31686004)(6486002)(6436002)(5660300002)(65956001)(4326008)(64756008)(36756003)(6512007)(53546011)(6506007)(386003)(2616005)(52116002)(14454004)(25786009)(478600001)(11346002)(76176011)(26005)(102836004)(73956011)(65806001)(446003)(316002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR1201MB2470;
 H:CY4PR1201MB0230.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: tIo1PU3sjLS8Mcn7wttycG8TZspJAWch9oKqMzgt7ukFbvSgZ9OJlaJloa1avd3eT6DHuHHs1DPkEkG5aLPRst26l6O0EkYJqOeIcIIwglU3uSjKgnLwDkiHQen3R9Vm5cT/DkpkPbr1F6NWQIyW2l71XyFz34XhbUnLzqYKE7t8YcrwV2JMBQ+O/dLIKMjMyuW3Y5diXioFlvb3X+SLCcuU3xFV6CH6FOVSZDZK8v++iombbjguKqbrQodXMM0s4lS8z2uIqumJ9yI/uTJPNmGp0XY2nfCDIhr9BWz8THQ2L7chrBTqH58QT2C9MgIlY1vsUAk07LCEX9AF5F9xvszBBkGpfVCeL3tUyM2626rFzExrO1IR1cjmGxXp0RkL0YeVprlsr63IkXZmQsU0+NcuVtuv+eV1bjNzXv3h/mk=
Content-ID: <E693EC37FC988B48BDD781A8459CA13B@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e9ec097-137a-48a8-6c92-08d6e5f37186
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 May 2019 18:11:46.7915 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hwentlan@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB2470
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pfQHyzhmvdlp2hExqNYDEMoy593a92yGLsULbsL8vRA=;
 b=V/Gy+lN5dyT0Fi/BsNZ1HtdZFzW+2Qh/BB4QZ32b8vmqWFsXJrEi7vkCQVUzB/GgJSNDM+IYugYNTQAx2YuMu9bHYb5uNDNxm5jgexYvmblgoCaz0nhqqPzcfw7Wzo70jT+edV4zXlMJN0SzsS4MR5hRsyei7Rimh2hStqg7XY0=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Harry.Wentland@amd.com; 
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
Cc: "Li, Sun peng \(Leo\)" <Sunpeng.Li@amd.com>, "Wentland,
 Harry" <Harry.Wentland@amd.com>, "Li, Roman" <Roman.Li@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

DQoNCk9uIDIwMTktMDUtMzAgMzo1MSBwLm0uLCBOaWNob2xhcyBLYXpsYXVza2FzIHdyb3RlOg0K
PiBbV2h5XQ0KPiBXaGVuIHN3aXRjaGluZyBmcm9tIHZ0IHRvIGRlc2t0b3Agd2l0aCBFRElEIGVt
dWxhdGlvbiB3ZSBjYW4gcmVjZWl2ZQ0KPiBhbiBhdG9taWMgY29tbWl0IHN1Y2ggdGhhdCB3ZSBo
YXZlIGEgY3J0YyB3aGVyZSBtb2RlX2NoYW5nZWQgPSB0cnVlLg0KPiANCj4gRHVyaW5nIHRoZSBk
bV91cGRhdGVfY3J0Y19zdGF0ZSBkaXNhYmxlIHBhc3Mgd2UgcmVtb3ZlIHRoZSBzdHJlYW0gZnJv
bQ0KPiB0aGUgY29udGV4dCBhbmQgZnJlZSBpdCBvbiB0aGUgZG1fbmV3X2NydGNfc3RhdGUuDQo+
IA0KPiBEdXJpbmcgdGhlIGVuYWJsZSBwYXNzIHdlIGNvbXBhcmUgdGhlIG5ldyBwcm92aXNpb25h
bCBzdHJlYW0gdG8gdGhlDQo+IGRtX29sZF9jcnRjX3N0YXRlLT5zdHJlYW0gYW5kIGRldGVybWlu
ZSB0aGF0IHRoZSBzdHJlYW0gaXMgdW5jaGFuZ2VkDQo+IGFuZCBubyBzY2FsaW5nIGhhcyBiZWVu
IGNoYW5nZWQuDQo+IA0KPiBGb2xsb3dpbmcgdGhpcywgbmV3X2NydGNfc3RhdGUtPm1vZGVfY2hh
bmdlZCBpcyB0aGVuIHNldCB0byBmYWxzZS4NCj4gVGhlIGNvbm5lY3RvcnMgaGF2ZW4ndCBjaGFu
Z2VkIGFuZCB0aGUgQ1JUQyBhY3RpdmUgc3RhdGUgaGFzbid0IGNoYW5nZWQNCj4gc28gZHJtX2F0
b21pY19jcnRjX25lZWRzX21vZGVzZXQgcmV0dXJucyBmYWxzZSwgc28gd2UganVtcCB0bw0KPiBz
a2lwX21vZGVzZXQgYW5kIHdlIGhpdDoNCj4gDQo+IEJVR19PTihkbV9uZXdfY3J0Y19zdGF0ZS0+
c3RyZWFtID09IE5VTEwpOw0KPiANCj4gLi4uc2luY2UgdGhlIG9sZCBzdHJlYW0gaXMgZ29uZSBm
cm9tIHRoZSBjb250ZXh0IGFuZCB0aGUgbmV3IHN0cmVhbSBpcw0KPiBhbHNvIHN0aWxsIE5VTEwu
DQo+IA0KPiBbSG93XQ0KPiBFbnN1cmUgdGhhdCB3ZSBzdGlsbCBhIHN0cmVhbSB0byByZXVzZSBi
ZWZvcmUgY2hlY2tpbmcgaWYgd2UgY2FuIHJldXNlDQo+IHRoZSBvbGQgc3RyZWFtIHdpdGhvdXQg
YSBmdWxsIG1vZGVzZXQuDQo+IA0KPiBDYzogUm9tYW4gTGkgPFJvbWFuLkxpQGFtZC5jb20+DQo+
IENjOiBMZW8gTGkgPHN1bnBlbmcubGlAYW1kLmNvbT4NCj4gQ2M6IEhhcnJ5IFdlbnRsYW5kIDxI
YXJyeS5XZW50bGFuZEBhbWQuY29tPg0KPiBTaWduZWQtb2ZmLWJ5OiBOaWNob2xhcyBLYXpsYXVz
a2FzIDxuaWNob2xhcy5rYXpsYXVza2FzQGFtZC5jb20+DQoNClJldmlld2VkLWJ5OiBIYXJyeSBX
ZW50bGFuZCA8aGFycnkud2VudGxhbmRAYW1kLmNvbT4NCg0KSGFycnkNCg0KPiAtLS0NCj4gIGRy
aXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmMgfCAxMiArKysr
KysrKysrKy0NCj4gIDEgZmlsZSBjaGFuZ2VkLCAxMSBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9u
KC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdw
dV9kbS9hbWRncHVfZG0uYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0v
YW1kZ3B1X2RtLmMNCj4gaW5kZXggNTczNTkwMzdlZDdjLi43OTZmODNjYTdhNGMgMTAwNjQ0DQo+
IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmMN
Cj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0u
Yw0KPiBAQCAtNjI0OCw3ICs2MjQ4LDE3IEBAIHN0YXRpYyBpbnQgZG1fdXBkYXRlX2NydGNfc3Rh
dGUoc3RydWN0IGFtZGdwdV9kaXNwbGF5X21hbmFnZXIgKmRtLA0KPiAgDQo+ICAJCWRtX25ld19j
cnRjX3N0YXRlLT5hYm1fbGV2ZWwgPSBkbV9uZXdfY29ubl9zdGF0ZS0+YWJtX2xldmVsOw0KPiAg
DQo+IC0JCWlmIChkY19pc19zdHJlYW1fdW5jaGFuZ2VkKG5ld19zdHJlYW0sIGRtX29sZF9jcnRj
X3N0YXRlLT5zdHJlYW0pICYmDQo+ICsJCS8qDQo+ICsJCSAqIElmIHdlIGFscmVhZHkgcmVtb3Zl
ZCB0aGUgb2xkIHN0cmVhbSBmcm9tIHRoZSBjb250ZXh0DQo+ICsJCSAqIChhbmQgc2V0IHRoZSBu
ZXcgc3RyZWFtIHRvIE5VTEwpIHRoZW4gd2UgY2FuJ3QgcmV1c2UNCj4gKwkJICogdGhlIG9sZCBz
dHJlYW0gZXZlbiBpZiB0aGUgc3RyZWFtIGFuZCBzY2FsaW5nIGFyZSB1bmNoYW5nZWQuDQo+ICsJ
CSAqIFdlJ2xsIGhpdCB0aGUgQlVHX09OIGFuZCBibGFjayBzY3JlZW4uDQo+ICsJCSAqDQo+ICsJ
CSAqIFRPRE86IFJlZmFjdG9yIHRoaXMgZnVuY3Rpb24gdG8gYWxsb3cgdGhpcyBjaGVjayB0byB3
b3JrDQo+ICsJCSAqIGluIGFsbCBjb25kaXRpb25zLg0KPiArCQkgKi8NCj4gKwkJaWYgKGRtX25l
d19jcnRjX3N0YXRlLT5zdHJlYW0gJiYNCj4gKwkJICAgIGRjX2lzX3N0cmVhbV91bmNoYW5nZWQo
bmV3X3N0cmVhbSwgZG1fb2xkX2NydGNfc3RhdGUtPnN0cmVhbSkgJiYNCj4gIAkJICAgIGRjX2lz
X3N0cmVhbV9zY2FsaW5nX3VuY2hhbmdlZChuZXdfc3RyZWFtLCBkbV9vbGRfY3J0Y19zdGF0ZS0+
c3RyZWFtKSkgew0KPiAgCQkJbmV3X2NydGNfc3RhdGUtPm1vZGVfY2hhbmdlZCA9IGZhbHNlOw0K
PiAgCQkJRFJNX0RFQlVHX0RSSVZFUigiTW9kZSBjaGFuZ2Ugbm90IHJlcXVpcmVkLCBzZXR0aW5n
IG1vZGVfY2hhbmdlZCB0byAlZCIsDQo+IA0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9hbWQtZ2Z4
