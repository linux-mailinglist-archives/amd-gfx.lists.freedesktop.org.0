Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CAF4130E07
	for <lists+amd-gfx@lfdr.de>; Mon,  6 Jan 2020 08:35:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3AB789E65;
	Mon,  6 Jan 2020 07:35:00 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2049.outbound.protection.outlook.com [40.107.236.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D38189E65;
 Mon,  6 Jan 2020 07:35:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=byd3HVqJUihpkWUZ+FJh9MEAbEwhXNt6iCueXUV9K5TlMonqRgvTmwXPJvpAONZmnGdRylz24UxPxo6VypPwa5cy8MPhbwd1h3C+8CazzNAUwUN+CBDe07fniYcURKycLO0wm51XL4frBiYqVH5D+DFHifkMjf1PSRzYusVHSIIEIln0TL/TgwGrPEtIemvSDuduuZajpbtw9qwvMfqo2Z1CA/IfeR102f/GWoU97pviYGuX2USNEMqsmURZ9ixlfqb0T5QCKkSnQNq4THEY9EUo61dYb8CV8Epf+VmunWMuptQza07jbndHvJFl+WmVb0p4xXkiWfhTXwN2UuhggQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=expJselTq2CzAtXpIDoEvlo3WhC9vunqvwCZJtqWXYo=;
 b=kwojLQMRFDZwo92F8P0YpKPVjLreIgpfGziaRWvjPHOw5HzEQz/gbJvn3z5MCMQiEgnVgVvTQpxFdoMOLq7VueFiFJiHl3dABO82pZ3MpQ/6p2Zn8Os2BvHUczss60SI9XQ4oM4x5AmbLRCDXO9S6IsGUtMsBE1JDv9RgK1T64zGp6RYHFW2C/iFEV3IDdWnijEvzjuYwGXLQHWLogW3QinAqz72Pz8h3XELM307rb9oG0KbXZTI0iZAP1rD6QhLifNPd+pnhmzs31UDthFYY3wLgXHQ5kSU9i3DqdtlXSXUa087IoNt7RhxVnKzQybu8XWqueUWr02NJzo7OhKi5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=expJselTq2CzAtXpIDoEvlo3WhC9vunqvwCZJtqWXYo=;
 b=yg0NcTmI5vkYCA74PLyCVQjerMsF2uK4qT2loFSh+FzzEhybyASBkhijoUMpQzYZnggy2m0MOjswt+6JG5RqM7uMGuhlvqlfLKSjr36i3/cY09IPn0gPTYKwz/CE46PYkmrQZ7tYvpxFVtHxKdpx93pe424GgKkh9jvD0E3LFKU=
Received: from DM6PR12MB4137.namprd12.prod.outlook.com (10.141.186.21) by
 DM6PR12MB3436.namprd12.prod.outlook.com (20.178.30.209) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2602.15; Mon, 6 Jan 2020 07:34:55 +0000
Received: from DM6PR12MB4137.namprd12.prod.outlook.com
 ([fe80::cd1d:def3:d2df:3882]) by DM6PR12MB4137.namprd12.prod.outlook.com
 ([fe80::cd1d:def3:d2df:3882%7]) with mapi id 15.20.2602.015; Mon, 6 Jan 2020
 07:34:55 +0000
From: "Lin, Wayne" <Wayne.Lin@amd.com>
To: Lyude Paul <lyude@redhat.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: =?utf-8?B?5Zue6KaGOiBbUEFUQ0hdIGRybS9kcF9tc3Q6IEF2b2lkIE5VTEwgcG9pbnRl?=
 =?utf-8?Q?r_dereference?=
Thread-Topic: [PATCH] drm/dp_mst: Avoid NULL pointer dereference
Thread-Index: AQHVu5TOp2ziWEIXvkaMjzIGzQrVLKfZc24AgAPcvxA=
Date: Mon, 6 Jan 2020 07:34:55 +0000
Message-ID: <DM6PR12MB41371F6DF18F0B9707B462FCFC3C0@DM6PR12MB4137.namprd12.prod.outlook.com>
References: <20191226023151.5448-1-Wayne.Lin@amd.com>
 <cfb5d28df84df7d3ce20656ca40be65713d5bdb0.camel@redhat.com>
In-Reply-To: <cfb5d28df84df7d3ce20656ca40be65713d5bdb0.camel@redhat.com>
Accept-Language: en-US, zh-TW
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_Enabled=true;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_SetDate=2020-01-06T07:34:54Z; 
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_Method=Privileged;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_Name=Public_0;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_ActionId=0c346221-0b6a-445a-a7d4-0000a425b760;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_ContentBits=1
msip_label_0d814d60-469d-470c-8cb0-58434e2bf457_enabled: true
msip_label_0d814d60-469d-470c-8cb0-58434e2bf457_setdate: 2020-01-06T07:37:07Z
msip_label_0d814d60-469d-470c-8cb0-58434e2bf457_method: Privileged
msip_label_0d814d60-469d-470c-8cb0-58434e2bf457_name: Public_0
msip_label_0d814d60-469d-470c-8cb0-58434e2bf457_siteid: 3dd8961f-e488-4e60-8e11-a82d994e183d
msip_label_0d814d60-469d-470c-8cb0-58434e2bf457_actionid: ab124782-4ac3-4d69-a894-0000f9feb082
msip_label_0d814d60-469d-470c-8cb0-58434e2bf457_contentbits: 0
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Wayne.Lin@amd.com; 
x-originating-ip: [165.204.68.36]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: b4200ae5-1428-4305-7a08-08d7927aecd9
x-ms-traffictypediagnostic: DM6PR12MB3436:|DM6PR12MB3436:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR12MB3436A304EB04701CD7F6B04EFC3C0@DM6PR12MB3436.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-forefront-prvs: 0274272F87
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(376002)(346002)(396003)(366004)(39860400002)(199004)(189003)(2906002)(4001150100001)(33656002)(6506007)(54906003)(110136005)(7696005)(71200400001)(26005)(316002)(224303003)(186003)(4326008)(55016002)(9686003)(8936002)(478600001)(81166006)(81156014)(76116006)(66946007)(86362001)(5660300002)(66556008)(66446008)(66476007)(64756008)(52536014);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3436;
 H:DM6PR12MB4137.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 577FqkYJWBcaOjHih9vYl2HzJmzlvwJk8aSF1o4PgEtPoN2dyK+r90V5iuJ528d2UTeqaoF3OhuXtnSYVLeGfK6usHd2UmGlApNZ5t864ioUonxM3NGxhkE/jQmsLeNe5JhCRCw8GAW75YSrlUdTr9Es3JmXIcU+AEhV0CC9cFAgi4xuGOXgGyFEitvkPj3gdrP1/7HedFZe9l/NzxSN+8Fiy+EkdsX4UMou4HvgbUKMb0OgirljvJf4O346hoQWlM65vLSbEa+sDrqITpLaCv51YA91J0iHQoALL3E4z5ynS86NrpQykUGxdFt8UsHl/3Vmn1j/Xtzk0xCaS2YoKo+SpyspuClkNfn5P3iOZ8mzF1bp23DoslMnZ31JdwrOaRtcmsQSmH1wo5AhZo7UO30qXKfd6jOzOGqva7nAIzoK685rvCsbCTVj1becJXT2
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b4200ae5-1428-4305-7a08-08d7927aecd9
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jan 2020 07:34:55.2639 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: q+0af4MsKxzOV8gBC0Xuj6tTQTpoIOTNalCozOeSD6L5Uw6lwMWvK4cnfkRjio9dxBiA0x9XNet2RpF3dfh3MA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3436
X-BeenThere: amd-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion list for AMD gfx <amd-gfx.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/amd-gfx>
List-Post: <mailto:amd-gfx@lists.freedesktop.org>
List-Help: <mailto:amd-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=subscribe>
Cc: "Zuo,
 Jerry" <Jerry.Zuo@amd.com>, "Lipski, Mikita" <Mikita.Lipski@amd.com>, "Wentland,
 Harry" <Harry.Wentland@amd.com>, "Kazlauskas,
 Nicholas" <Nicholas.Kazlauskas@amd.com>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

W0FNRCBQdWJsaWMgVXNlXQ0KDQoNCg0KPiAtLS0tLeWOn+Wni+mDteS7ti0tLS0tDQo+IOWvhOS7
tuiAhTogTHl1ZGUgUGF1bCA8bHl1ZGVAcmVkaGF0LmNvbT4NCj4g5a+E5Lu25pel5pyfOiBTYXR1
cmRheSwgSmFudWFyeSA0LCAyMDIwIDQ6MzUgQU0NCj4g5pS25Lu26ICFOiBMaW4sIFdheW5lIDxX
YXluZS5MaW5AYW1kLmNvbT47IGRyaS0NCj4gZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBh
bWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiDlia/mnKw6IEthemxhdXNrYXMsIE5pY2hv
bGFzIDxOaWNob2xhcy5LYXpsYXVza2FzQGFtZC5jb20+OyBXZW50bGFuZCwNCj4gSGFycnkgPEhh
cnJ5LldlbnRsYW5kQGFtZC5jb20+OyBMaXBza2ksIE1pa2l0YSA8TWlraXRhLkxpcHNraUBhbWQu
Y29tPjsNCj4gWnVvLCBKZXJyeSA8SmVycnkuWnVvQGFtZC5jb20+OyBzdGFibGVAdmdlci5rZXJu
ZWwub3JnDQo+IOS4u+aXqDogUmU6IFtQQVRDSF0gZHJtL2RwX21zdDogQXZvaWQgTlVMTCBwb2lu
dGVyIGRlcmVmZXJlbmNlDQo+IA0KPiBCYWNrIGZyb20gdGhlIGhvbGlkYXlzIQ0KPiANCj4gUmV2
aWV3ZWQtYnk6IEx5dWRlIFBhdWwgPGx5dWRlQHJlZGhhdC5jb20+DQo+IA0KPiBEbyB5b3UgbmVl
ZCBtZSB0byBwdXNoIHRoaXMgdG8gZHJtLW1pc2M/DQo+IA0KVGhhbmtzIGZvciB5b3VyIHRpbWUh
DQpBbmQgeWVzLCBwbGVhc2UgaGVscCB0byBwdXNoIHRoaXMgdG8gZHJtLW1pc2MuDQoNCj4gT24g
VGh1LCAyMDE5LTEyLTI2IGF0IDEwOjMxICswODAwLCBXYXluZSBMaW4gd3JvdGU6DQo+ID4gW1do
eV0NCj4gPiBGb3VuZCBrZXJuZWwgTlVMTCBwb2ludGVyIGRlcmVmZXJlbmNlIHVuZGVyIHRoZSBi
ZWxvdyBzaXR1YXRpb246DQo+ID4NCj4gPiAJc3JjIOKAlCBIRE1JX01vbml0b3IgICBzcmMg4oCU
IEhETUlfTW9uaXRvcg0KPiA+IGUuZy46CSAgICBcICAgICAgICAgICAgPT4NCj4gPiAJICAgICBN
U1RCIOKAlCBNU1RCICAgICAodW5wbHVnKSBNU1RCIOKAlCBNU1RCDQo+ID4NCj4gPiBXaGVuIGRp
c3BsYXkgMSBIRE1JIGFuZCAyIERQIGRhaXN5IGNoYWluIG1vbml0b3JzLCB1bnBsdWdnaW5nIHRo
ZSBkcA0KPiA+IGNhYmxlIGNvbm5lY3RlZCB0byBzb3VyY2UgY2F1c2VzIGtlcm5lbCBOVUxMIHBv
aW50ZXIgZGVyZWZlcmVuY2UgYXQNCj4gPiBkcm1fZHBfbXN0X2F0b21pY19jaGVja19id19saW1p
dCgpLiBXaGVuIGNhbGN1bGF0aW5nIHBibl9saW1pdCwgaWYNCj4gPiBicmFuY2ggaXMgbnVsbCwg
YWNjZXNzaW5nICImYnJhbmNoLT5wb3J0cyIgY2F1c2VzIHRoZSBwcm9ibGVtLg0KPiA+DQo+ID4g
W0hvd10NCj4gPiBKdWRnZSBicmFuY2ggaXMgbnVsbCBvciBub3QgYXQgdGhlIGJlZ2lubmluZy4g
SWYgaXQgaXMgbnVsbCwgcmV0dXJuIDAuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBXYXluZSBM
aW4gPFdheW5lLkxpbkBhbWQuY29tPg0KPiA+IENjOiBzdGFibGVAdmdlci5rZXJuZWwub3JnDQo+
ID4gLS0tDQo+ID4gIGRyaXZlcnMvZ3B1L2RybS9kcm1fZHBfbXN0X3RvcG9sb2d5LmMgfCAzICsr
Kw0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspDQo+ID4NCj4gPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9kcF9tc3RfdG9wb2xvZ3kuYw0KPiA+IGIvZHJpdmVy
cy9ncHUvZHJtL2RybV9kcF9tc3RfdG9wb2xvZ3kuYw0KPiA+IGluZGV4IDdkMmQzMWVhZjAwMy4u
YTY0NzNlM2FiNDQ4IDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZHBfbXN0
X3RvcG9sb2d5LmMNCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2RwX21zdF90b3BvbG9n
eS5jDQo+ID4gQEAgLTQ3MDcsNiArNDcwNyw5IEBAIGludCBkcm1fZHBfbXN0X2F0b21pY19jaGVj
a19id19saW1pdChzdHJ1Y3QNCj4gPiBkcm1fZHBfbXN0X2JyYW5jaCAqYnJhbmNoLA0KPiA+ICAJ
c3RydWN0IGRybV9kcF92Y3BpX2FsbG9jYXRpb24gKnZjcGk7DQo+ID4gIAlpbnQgcGJuX2xpbWl0
ID0gMCwgcGJuX3VzZWQgPSAwOw0KPiA+DQo+ID4gKwlpZiAoIWJyYW5jaCkNCj4gPiArCQlyZXR1
cm4gMDsNCj4gPiArDQo+ID4gIAlsaXN0X2Zvcl9lYWNoX2VudHJ5KHBvcnQsICZicmFuY2gtPnBv
cnRzLCBuZXh0KSB7DQo+ID4gIAkJaWYgKHBvcnQtPm1zdGIpDQo+ID4gIAkJCWlmIChkcm1fZHBf
bXN0X2F0b21pY19jaGVja19id19saW1pdChwb3J0LT5tc3RiLA0KPiA+IG1zdF9zdGF0ZSkpDQo+
IC0tDQo+IENoZWVycywNCj4gCUx5dWRlIFBhdWwNCi0tDQpCZXN0IHJlZ2FyZHMsDQpXYXluZSBM
aW4NCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1n
ZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeAo=
