Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D80F91F44
	for <lists+amd-gfx@lfdr.de>; Mon, 19 Aug 2019 10:46:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABBE16E0DF;
	Mon, 19 Aug 2019 08:46:26 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770052.outbound.protection.outlook.com [40.107.77.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 910F56E0DF
 for <amd-gfx@lists.freedesktop.org>; Mon, 19 Aug 2019 08:46:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IhLHB+gsxtkIvg5ETkd9cV95sy6aoDi24e9ZJrRxSLZHcU/U/FuRGfuqFjWj7bAiLvAIR4LmRYZPU33Obji455/AESeKLR1KcZaFy64vPpWgpyiFSTCWlWfwvQnUQOQbaWqeJrJJfuoby9lK602m8KRlXM5cUnSOPwNsoYLV+/LnENGbyIeTdy2Do1BmZwnAGYXgMNrfS4CU5vBwRnDuO43vgq0AKi48fRrC8Va/ZbPXuQozLmnpk2zWEojGXQwkf0Kqs8bztBAWyKIg2MGOeY1zf6MdYqudsf8HIbD+KaItIPMuKT2NfKSoFyxeq3PZ1c7x1Xjmuxqj8uwpMsbcdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ULmrvZx7uEw6FVdSPjwch8jJNPoVS+BWe52bzEqS0/Y=;
 b=H0Mjz3HzZcJm5yAL0x3wgXwJ/tiRfwmZr8MshvdAp0RYO1DAhyX2kyna/r1tlSVJqP+PBTva14hwBNdDOA9X7mi3Sfj/WZ6/rP42iIn1bzKM0XP2oMyMQM1fY0NpnTMomjwwxYEgWN3YdI+qZzGyllrZdpexaMMmBocb8reYTj3U5SPYmhMc/NHWQdjXNX8oVG4M1qh4cr4U4Zbqt6AiJaZNRkuJZ74VW7LJzuJtJfBCYYVxFXnOmB7yHfHVjKGJ9WgRIamdKUo47rteKNIY+0+hPR26YmZz6Sm9P5lpY3lNb+mDnBD7tvCvruDpLoHM47AqyCwDSRt7JJhEPtDbSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM5PR12MB1705.namprd12.prod.outlook.com (10.175.88.22) by
 DM5PR12MB1212.namprd12.prod.outlook.com (10.168.237.15) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.18; Mon, 19 Aug 2019 08:46:23 +0000
Received: from DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::a129:1f1a:52a9:4ac3]) by DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::a129:1f1a:52a9:4ac3%5]) with mapi id 15.20.2178.018; Mon, 19 Aug 2019
 08:46:23 +0000
From: "Koenig, Christian" <Christian.Koenig@amd.com>
To: "Yin, Tianci (Rico)" <Tianci.Yin@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/amdgpu/psp: move TMR to cpu invisible vram region
Thread-Topic: [PATCH] drm/amdgpu/psp: move TMR to cpu invisible vram region
Thread-Index: AQHVVmTwgdUy4jJzNUyYPqX3ojC+DacCHaIAgAAAMwiAAAqBAA==
Date: Mon, 19 Aug 2019 08:46:23 +0000
Message-ID: <d0ddbe80-0f7f-046d-94f1-1620865b07c8@amd.com>
References: <1566201945-18101-1-git-send-email-tianci.yin@amd.com>
 <b1b7dd46-8ee5-deaf-1a24-ef152c96dcb6@gmail.com>
 <MN2PR12MB2974D98262E42F1C6FB6644A95A80@MN2PR12MB2974.namprd12.prod.outlook.com>
In-Reply-To: <MN2PR12MB2974D98262E42F1C6FB6644A95A80@MN2PR12MB2974.namprd12.prod.outlook.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-originating-ip: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
x-clientproxiedby: MR2P264CA0077.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:32::17) To DM5PR12MB1705.namprd12.prod.outlook.com
 (2603:10b6:3:10c::22)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 17a17720-24b9-4785-7856-08d72481b70d
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM5PR12MB1212; 
x-ms-traffictypediagnostic: DM5PR12MB1212:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR12MB1212E16FB05FCA9ED2A21A3E83A80@DM5PR12MB1212.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4303;
x-forefront-prvs: 0134AD334F
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(346002)(136003)(39860400002)(376002)(366004)(199004)(189003)(14454004)(7736002)(52116002)(4326008)(6436002)(6246003)(229853002)(54896002)(64126003)(65826007)(53936002)(478600001)(6486002)(66446008)(66476007)(66556008)(64756008)(66946007)(81156014)(81166006)(6116002)(8936002)(2906002)(8676002)(71200400001)(71190400001)(14444005)(256004)(76176011)(36756003)(110136005)(58126008)(25786009)(54906003)(316002)(65806001)(31696002)(2501003)(6512007)(46003)(105004)(476003)(99286004)(65956001)(102836004)(386003)(186003)(53546011)(2616005)(486006)(6506007)(11346002)(446003)(86362001)(5660300002)(236005)(19627405001)(31686004)(66574012);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1212;
 H:DM5PR12MB1705.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: m+U6K2OlAhctiNPm2utoeLszN4d82yqR9JpJxVD+wDseYfrtrobx9gUZBk4oY/s9/NgzGj+fK8zK+lYeF1dRFbThtd0x4jmA5EPz5LlKbZUAEgQxbFA+x79a0GBX2e0lwggodqk9SRb3LcUgF+DFU2/4iJe5RptKXGhlWXRtsATMRBs2ElXbxPWPh5THjyVaO4QvHsjPBAHa/G3HhnqODbhhYcAlP1h01tDRNeAAwMDzrsbPD8NL5QPncW6+VqW8uAz3InNaxnrz4bImOkMLhNls+kBAEvy014y722nganNXCJAj5BRJTlb2AF1x7alsU9i0z9rFh7pz4SmH/P9EVzhi/q/ydO7+7ZnXkBYtf74ZPB9S1LOuPNRo82GDE+6wPYd/0nh2SkcyIun9UnKGJWzyLcbK6yDdRbyWWfuTFg8=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 17a17720-24b9-4785-7856-08d72481b70d
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Aug 2019 08:46:23.8658 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: x9ye3l6xhiBLEkvonXxQDxak8/VsJq7kiR5kUE8e7Ep6HWTXa7/6QlhF3XBN34JH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1212
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ULmrvZx7uEw6FVdSPjwch8jJNPoVS+BWe52bzEqS0/Y=;
 b=KLRuThyc9cbj2qXb3N/a8+EArVGxVZNjxq5JYwBXCHM2OeH6I2R4maEsQAMlqMLNfnjIh7Jr5nb/iv9GuEyYAi5HmfKU7HfcGz7jKBZYOAFKXMoRyTT/EDAzn87TryBiur6OJieQe4WCqChPByJXiun/4UXohw7TjGE9gvKS7RM=
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
Cc: "Xiao, Jack" <Jack.Xiao@amd.com>, "Zhang, Hawking" <Hawking.Zhang@amd.com>,
 "Yuan, Xiaojie" <Xiaojie.Yuan@amd.com>
Content-Type: multipart/mixed; boundary="===============0704697644=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============0704697644==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_d0ddbe800f7f046d94f11620865b07c8amdcom_"

--_000_d0ddbe800f7f046d94f11620865b07c8amdcom_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T0gsIFNUT1AhICBHb29kIHRoYXQgd2UgdGFsa2VkIGFib3V0IHRoYXQgYmVjYXVzZSB0aGF0IHdv
dWxkIGhhdmUgY2F1c2VkIHF1aXRlIGEgYnVuY2ggb2YgdHJvdWJsZS4NCg0KVGhlIGNhc2UgaW4g
YW1kZ3B1X3R0bV9pbml0KCkgd291bGQgYnJlYWssIHdlIGludGVudGlvbmFsbHkgcmVzZXJ2ZSBt
ZW1vcnkgYXQgdGhlIGJlZ2lubmluZyBvZiB0aGUgdmlzaWJsZSBzcGFjZSBoZXJlIHRvIGF2b2lk
IHByb2JsZW0gc3dpdGNoaW5nIGJldHdlZW4gVkJJT1MgYW5kIEtNUy4NCg0KSSBzdWdnZXN0IHRv
IGZpcnN0IGFkZCBhIGR1bW15IHBvaW50ZXIgdG8gYW1kZ3B1X3R0bV9pbml0KCkgdG8gZml4IHRo
aXMgYmVmb3JlIHlvdSBhcHBseSB0aGlzIHBhdGNoLg0KDQpSZWdhcmRzLA0KQ2hyaXN0aWFuLg0K
DQpBbSAxOS4wOC4xOSB1bSAxMDoxNiBzY2hyaWViIFlpbiwgVGlhbmNpIChSaWNvKToNClRoYW5r
cyB2ZXJ5IG11Y2ggQ2hyaXN0aWFuIQ0KDQpJIHNjYW5uZWQgdGhlIHdob2xlIGNvZGUsIG9ubHkg
dHdvIGZ1bmN0aW9ucyBwYXNzIGluIE5VTEwgY3B1X2FkZHIsDQphbWRncHVfdHRtX2luaXQoKSBh
bmQgZ2Z4X3Y5XzBfbmdnX2NyZWF0ZV9idWYoKSwNCmJ1dCB0aGUgcmVsYXRlZCBCT3MgYXJlIG5v
dCBmdXJ0aGVyIG1hcHBlZCBmb3IgY3B1IGFjY2Vzcy4NCnNvIEkgdGhpbmsgdGhpcyBjaGFuZ2Ug
aXMgc2FmZS4NCg0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXw0KRnJvbTogQ2hy
aXN0aWFuIEvDtm5pZyA8Y2tvZW5pZy5sZWljaHR6dW1lcmtlbkBnbWFpbC5jb20+PG1haWx0bzpj
a29lbmlnLmxlaWNodHp1bWVya2VuQGdtYWlsLmNvbT4NClNlbnQ6IE1vbmRheSwgQXVndXN0IDE5
LCAyMDE5IDE2OjA3DQpUbzogWWluLCBUaWFuY2kgKFJpY28pIDxUaWFuY2kuWWluQGFtZC5jb20+
PG1haWx0bzpUaWFuY2kuWWluQGFtZC5jb20+OyBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZzxtYWlsdG86YW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmc+IDxhbWQtZ2Z4QGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZz48bWFpbHRvOmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPg0KQ2M6
IFhpYW8sIEphY2sgPEphY2suWGlhb0BhbWQuY29tPjxtYWlsdG86SmFjay5YaWFvQGFtZC5jb20+
OyBZdWFuLCBYaWFvamllIDxYaWFvamllLll1YW5AYW1kLmNvbT48bWFpbHRvOlhpYW9qaWUuWXVh
bkBhbWQuY29tPjsgWmhhbmcsIEhhd2tpbmcgPEhhd2tpbmcuWmhhbmdAYW1kLmNvbT48bWFpbHRv
Okhhd2tpbmcuWmhhbmdAYW1kLmNvbT4NClN1YmplY3Q6IFJlOiBbUEFUQ0hdIGRybS9hbWRncHUv
cHNwOiBtb3ZlIFRNUiB0byBjcHUgaW52aXNpYmxlIHZyYW0gcmVnaW9uDQoNCkFtIDE5LjA4LjE5
IHVtIDEwOjA1IHNjaHJpZWIgVGlhbmNpIFlpbjoNCj4gRnJvbTogIlRpYW5jaS5ZaW4iIDx0aWFu
Y2kueWluQGFtZC5jb20+PG1haWx0bzp0aWFuY2kueWluQGFtZC5jb20+DQo+DQo+IHNvIHRoYXQg
bW9yZSB2aXNpYmxlIHZyYW0gY2FuIGJlIGF2YWlsYWJsZSBmb3IgdW1kLg0KPg0KPiBTaWduZWQt
b2ZmLWJ5OiBUaWFuY2kuWWluIDx0aWFuY2kueWluQGFtZC5jb20+PG1haWx0bzp0aWFuY2kueWlu
QGFtZC5jb20+DQoNCkFzc3VtaW5nIHRoYXQgeW91IGNoZWNrZWQgdGhhdCB3ZSBkb24ndCBoYXZl
IG90aGVyIHVzZXJzIHdobyBhcmUgdXNpbmcNCmFtZGdwdV9ib19jcmVhdGVfa2VybmVsKCkgd2l0
aG91dCBhIENQVSBwb2ludGVyIHRoaXMgcGF0Y2ggaXMNClJldmlld2VkLWJ5OiBDaHJpc3RpYW4g
S8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+PG1haWx0bzpjaHJpc3RpYW4ua29lbmln
QGFtZC5jb20+Lg0KDQo+IC0tLQ0KPiAgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdw
dV9vYmplY3QuYyB8IDUgKysrLS0NCj4gICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRn
cHVfcHNwLmMgICAgfCA0ICsrLS0NCj4gICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRn
cHVfcHNwLmggICAgfCAxIC0NCj4gICAzIGZpbGVzIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwg
NSBkZWxldGlvbnMoLSkNCj4NCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2FtZGdwdV9vYmplY3QuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9v
YmplY3QuYw0KPiBpbmRleCAxMDU5NzcxLi4wNDc2NzkwIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfb2JqZWN0LmMNCj4gKysrIGIvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvYW1kZ3B1X29iamVjdC5jDQo+IEBAIC0yNDYsOCArMjQ2LDkgQEAgaW50
IGFtZGdwdV9ib19jcmVhdGVfcmVzZXJ2ZWQoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsDQo+
ICAgICAgICBicC5zaXplID0gc2l6ZTsNCj4gICAgICAgIGJwLmJ5dGVfYWxpZ24gPSBhbGlnbjsN
Cj4gICAgICAgIGJwLmRvbWFpbiA9IGRvbWFpbjsNCj4gLSAgICAgYnAuZmxhZ3MgPSBBTURHUFVf
R0VNX0NSRUFURV9DUFVfQUNDRVNTX1JFUVVJUkVEIHwNCj4gLSAgICAgICAgICAgICBBTURHUFVf
R0VNX0NSRUFURV9WUkFNX0NPTlRJR1VPVVM7DQo+ICsgICAgIGJwLmZsYWdzID0gY3B1X2FkZHIg
PyBBTURHUFVfR0VNX0NSRUFURV9DUFVfQUNDRVNTX1JFUVVJUkVEDQo+ICsgICAgICAgICAgICAg
OiBBTURHUFVfR0VNX0NSRUFURV9OT19DUFVfQUNDRVNTOw0KPiArICAgICBicC5mbGFncyB8PSBB
TURHUFVfR0VNX0NSRUFURV9WUkFNX0NPTlRJR1VPVVM7DQo+ICAgICAgICBicC50eXBlID0gdHRt
X2JvX3R5cGVfa2VybmVsOw0KPiAgICAgICAgYnAucmVzdiA9IE5VTEw7DQo+DQo+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcHNwLmMgYi9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcHNwLmMNCj4gaW5kZXggNzcxNWMwZC4uNWU3ZmJiZSAx
MDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3BzcC5jDQo+
ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9wc3AuYw0KPiBAQCAtMjY0
LDcgKzI2NCw3IEBAIHN0YXRpYyBpbnQgcHNwX3Rtcl9pbml0KHN0cnVjdCBwc3BfY29udGV4dCAq
cHNwKQ0KPg0KPiAgICAgICAgcmV0ID0gYW1kZ3B1X2JvX2NyZWF0ZV9rZXJuZWwocHNwLT5hZGV2
LCB0bXJfc2l6ZSwgUFNQX1RNUl9TSVpFLA0KPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgQU1ER1BVX0dFTV9ET01BSU5fVlJBTSwNCj4gLSAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgJnBzcC0+dG1yX2JvLCAmcHNwLT50bXJfbWNfYWRkciwgJnBzcC0+dG1y
X2J1Zik7DQo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICZwc3AtPnRtcl9i
bywgJnBzcC0+dG1yX21jX2FkZHIsIE5VTEwpOw0KPg0KPiAgICAgICAgcmV0dXJuIHJldDsNCj4g
ICB9DQo+IEBAIC0xMjE1LDcgKzEyMTUsNyBAQCBzdGF0aWMgaW50IHBzcF9od19maW5pKHZvaWQg
KmhhbmRsZSkNCj4NCj4gICAgICAgIHBzcF9yaW5nX2Rlc3Ryb3kocHNwLCBQU1BfUklOR19UWVBF
X19LTSk7DQo+DQo+IC0gICAgIGFtZGdwdV9ib19mcmVlX2tlcm5lbCgmcHNwLT50bXJfYm8sICZw
c3AtPnRtcl9tY19hZGRyLCAmcHNwLT50bXJfYnVmKTsNCj4gKyAgICAgYW1kZ3B1X2JvX2ZyZWVf
a2VybmVsKCZwc3AtPnRtcl9ibywgJnBzcC0+dG1yX21jX2FkZHIsIE5VTEwpOw0KPiAgICAgICAg
YW1kZ3B1X2JvX2ZyZWVfa2VybmVsKCZwc3AtPmZ3X3ByaV9ibywNCj4gICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAmcHNwLT5md19wcmlfbWNfYWRkciwgJnBzcC0+ZndfcHJpX2J1Zik7DQo+
ICAgICAgICBhbWRncHVfYm9fZnJlZV9rZXJuZWwoJnBzcC0+ZmVuY2VfYnVmX2JvLA0KPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3BzcC5oIGIvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3BzcC5oDQo+IGluZGV4IDAwMjlmYTIuLjQ4YjA1
N2QgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9wc3Au
aA0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcHNwLmgNCj4gQEAg
LTE3Miw3ICsxNzIsNiBAQCBzdHJ1Y3QgcHNwX2NvbnRleHQNCj4gICAgICAgIC8qIHRtciBidWZm
ZXIgKi8NCj4gICAgICAgIHN0cnVjdCBhbWRncHVfYm8gICAgICAgICAgICAgICAgKnRtcl9ibzsN
Cj4gICAgICAgIHVpbnQ2NF90ICAgICAgICAgICAgICAgICAgICAgICAgdG1yX21jX2FkZHI7DQo+
IC0gICAgIHZvaWQgICAgICAgICAgICAgICAgICAgICAgICAgICAgKnRtcl9idWY7DQo+DQo+ICAg
ICAgICAvKiBhc2QgZmlybXdhcmUgYW5kIGJ1ZmZlciAqLw0KPiAgICAgICAgY29uc3Qgc3RydWN0
IGZpcm13YXJlICAgICAgICAgICAqYXNkX2Z3Ow0KDQoNCg==

--_000_d0ddbe800f7f046d94f11620865b07c8amdcom_
Content-Type: text/html; charset="utf-8"
Content-ID: <9DBA5CA8B28BA946886B0FF22070D59D@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64

PGh0bWw+DQo8aGVhZD4NCjxtZXRhIGh0dHAtZXF1aXY9IkNvbnRlbnQtVHlwZSIgY29udGVudD0i
dGV4dC9odG1sOyBjaGFyc2V0PXV0Zi04Ij4NCjwvaGVhZD4NCjxib2R5IHRleHQ9IiMwMDAwMDAi
IGJnY29sb3I9IiNGRkZGRkYiPg0KPGRpdiBjbGFzcz0ibW96LWNpdGUtcHJlZml4Ij5PSCwgU1RP
UCEmbmJzcDsgR29vZCB0aGF0IHdlIHRhbGtlZCBhYm91dCB0aGF0IGJlY2F1c2UgdGhhdCB3b3Vs
ZCBoYXZlIGNhdXNlZCBxdWl0ZSBhIGJ1bmNoIG9mIHRyb3VibGUuPGJyPg0KPGJyPg0KVGhlIGNh
c2UgaW4gYW1kZ3B1X3R0bV9pbml0KCkgd291bGQgYnJlYWssIHdlIGludGVudGlvbmFsbHkgcmVz
ZXJ2ZSBtZW1vcnkgYXQgdGhlIGJlZ2lubmluZyBvZiB0aGUgdmlzaWJsZSBzcGFjZSBoZXJlIHRv
IGF2b2lkIHByb2JsZW0gc3dpdGNoaW5nIGJldHdlZW4gVkJJT1MgYW5kIEtNUy48YnI+DQo8YnI+
DQpJIHN1Z2dlc3QgdG8gZmlyc3QgYWRkIGEgZHVtbXkgcG9pbnRlciB0byBhbWRncHVfdHRtX2lu
aXQoKSB0byBmaXggdGhpcyBiZWZvcmUgeW91IGFwcGx5IHRoaXMgcGF0Y2guPGJyPg0KPGJyPg0K
UmVnYXJkcyw8YnI+DQpDaHJpc3RpYW4uPGJyPg0KPGJyPg0KQW0gMTkuMDguMTkgdW0gMTA6MTYg
c2NocmllYiBZaW4sIFRpYW5jaSAoUmljbyk6PGJyPg0KPC9kaXY+DQo8YmxvY2txdW90ZSB0eXBl
PSJjaXRlIiBjaXRlPSJtaWQ6TU4yUFIxMk1CMjk3NEQ5ODI2MkU0MkYxQzZGQjY2NDRBOTVBODBA
TU4yUFIxMk1CMjk3NC5uYW1wcmQxMi5wcm9kLm91dGxvb2suY29tIj4NCjxzdHlsZSB0eXBlPSJ0
ZXh0L2NzcyIgc3R5bGU9ImRpc3BsYXk6bm9uZTsiPiBQIHttYXJnaW4tdG9wOjA7bWFyZ2luLWJv
dHRvbTowO30gPC9zdHlsZT4NCjxkaXYgc3R5bGU9ImZvbnQtZmFtaWx5OiBDYWxpYnJpLCBBcmlh
bCwgSGVsdmV0aWNhLCBzYW5zLXNlcmlmOw0KICAgICAgICBmb250LXNpemU6IDEycHQ7IGNvbG9y
OiByZ2IoMCwgMCwgMCk7Ij4NClRoYW5rcyB2ZXJ5IG11Y2ggQ2hyaXN0aWFuITwvZGl2Pg0KPGRp
diBzdHlsZT0iZm9udC1mYW1pbHk6IENhbGlicmksIEFyaWFsLCBIZWx2ZXRpY2EsIHNhbnMtc2Vy
aWY7DQogICAgICAgIGZvbnQtc2l6ZTogMTJwdDsgY29sb3I6IHJnYigwLCAwLCAwKTsiPg0KPGJy
Pg0KPC9kaXY+DQo8ZGl2IHN0eWxlPSJmb250LWZhbWlseTogQ2FsaWJyaSwgQXJpYWwsIEhlbHZl
dGljYSwgc2Fucy1zZXJpZjsNCiAgICAgICAgZm9udC1zaXplOiAxMnB0OyBjb2xvcjogcmdiKDAs
IDAsIDApOyI+DQpJIHNjYW5uZWQgdGhlIHdob2xlIGNvZGUsIG9ubHkgdHdvIGZ1bmN0aW9ucyBw
YXNzIGluIE5VTEwgY3B1X2FkZHIsPC9kaXY+DQo8ZGl2IHN0eWxlPSJmb250LWZhbWlseTogQ2Fs
aWJyaSwgQXJpYWwsIEhlbHZldGljYSwgc2Fucy1zZXJpZjsNCiAgICAgICAgZm9udC1zaXplOiAx
MnB0OyBjb2xvcjogcmdiKDAsIDAsIDApOyI+DQphbWRncHVfdHRtX2luaXQoKSBhbmQgZ2Z4X3Y5
XzBfbmdnX2NyZWF0ZV9idWYoKSw8L2Rpdj4NCjxkaXYgc3R5bGU9ImZvbnQtZmFtaWx5OiBDYWxp
YnJpLCBBcmlhbCwgSGVsdmV0aWNhLCBzYW5zLXNlcmlmOw0KICAgICAgICBmb250LXNpemU6IDEy
cHQ7IGNvbG9yOiByZ2IoMCwgMCwgMCk7Ij4NCmJ1dCB0aGUgcmVsYXRlZCBCT3MgYXJlIG5vdCBm
dXJ0aGVyIG1hcHBlZCBmb3IgY3B1IGFjY2Vzcy48L2Rpdj4NCjxkaXYgc3R5bGU9ImZvbnQtZmFt
aWx5OiBDYWxpYnJpLCBBcmlhbCwgSGVsdmV0aWNhLCBzYW5zLXNlcmlmOw0KICAgICAgICBmb250
LXNpemU6IDEycHQ7IGNvbG9yOiByZ2IoMCwgMCwgMCk7Ij4NCnNvIEkgdGhpbmsgdGhpcyBjaGFu
Z2UgaXMgc2FmZS48L2Rpdj4NCjxkaXYgc3R5bGU9ImZvbnQtZmFtaWx5OiBDYWxpYnJpLCBBcmlh
bCwgSGVsdmV0aWNhLCBzYW5zLXNlcmlmOw0KICAgICAgICBmb250LXNpemU6IDEycHQ7IGNvbG9y
OiByZ2IoMCwgMCwgMCk7Ij4NCjxicj4NCjwvZGl2Pg0KPGRpdiBzdHlsZT0iZm9udC1mYW1pbHk6
IENhbGlicmksIEFyaWFsLCBIZWx2ZXRpY2EsIHNhbnMtc2VyaWY7DQogICAgICAgIGZvbnQtc2l6
ZTogMTJwdDsgY29sb3I6IHJnYigwLCAwLCAwKTsiPg0KPGJyPg0KPC9kaXY+DQo8aHIgc3R5bGU9
ImRpc3BsYXk6aW5saW5lLWJsb2NrO3dpZHRoOjk4JSIgdGFiaW5kZXg9Ii0xIj4NCjxkaXYgaWQ9
ImRpdlJwbHlGd2RNc2ciIGRpcj0ibHRyIj48Zm9udCBzdHlsZT0iZm9udC1zaXplOjExcHQiIGZh
Y2U9IkNhbGlicmksIHNhbnMtc2VyaWYiIGNvbG9yPSIjMDAwMDAwIj48Yj5Gcm9tOjwvYj4gQ2hy
aXN0aWFuIEvDtm5pZw0KPGEgY2xhc3M9Im1vei10eHQtbGluay1yZmMyMzk2RSIgaHJlZj0ibWFp
bHRvOmNrb2VuaWcubGVpY2h0enVtZXJrZW5AZ21haWwuY29tIj4mbHQ7Y2tvZW5pZy5sZWljaHR6
dW1lcmtlbkBnbWFpbC5jb20mZ3Q7PC9hPjxicj4NCjxiPlNlbnQ6PC9iPiBNb25kYXksIEF1Z3Vz
dCAxOSwgMjAxOSAxNjowNzxicj4NCjxiPlRvOjwvYj4gWWluLCBUaWFuY2kgKFJpY28pIDxhIGNs
YXNzPSJtb3otdHh0LWxpbmstcmZjMjM5NkUiIGhyZWY9Im1haWx0bzpUaWFuY2kuWWluQGFtZC5j
b20iPg0KJmx0O1RpYW5jaS5ZaW5AYW1kLmNvbSZndDs8L2E+OyA8YSBjbGFzcz0ibW96LXR4dC1s
aW5rLWFiYnJldmlhdGVkIiBocmVmPSJtYWlsdG86YW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5v
cmciPg0KYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmc8L2E+IDxhIGNsYXNzPSJtb3otdHh0
LWxpbmstcmZjMjM5NkUiIGhyZWY9Im1haWx0bzphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZyI+DQombHQ7YW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcmZ3Q7PC9hPjxicj4NCjxiPkNj
OjwvYj4gWGlhbywgSmFjayA8YSBjbGFzcz0ibW96LXR4dC1saW5rLXJmYzIzOTZFIiBocmVmPSJt
YWlsdG86SmFjay5YaWFvQGFtZC5jb20iPg0KJmx0O0phY2suWGlhb0BhbWQuY29tJmd0OzwvYT47
IFl1YW4sIFhpYW9qaWUgPGEgY2xhc3M9Im1vei10eHQtbGluay1yZmMyMzk2RSIgaHJlZj0ibWFp
bHRvOlhpYW9qaWUuWXVhbkBhbWQuY29tIj4NCiZsdDtYaWFvamllLll1YW5AYW1kLmNvbSZndDs8
L2E+OyBaaGFuZywgSGF3a2luZyA8YSBjbGFzcz0ibW96LXR4dC1saW5rLXJmYzIzOTZFIiBocmVm
PSJtYWlsdG86SGF3a2luZy5aaGFuZ0BhbWQuY29tIj4NCiZsdDtIYXdraW5nLlpoYW5nQGFtZC5j
b20mZ3Q7PC9hPjxicj4NCjxiPlN1YmplY3Q6PC9iPiBSZTogW1BBVENIXSBkcm0vYW1kZ3B1L3Bz
cDogbW92ZSBUTVIgdG8gY3B1IGludmlzaWJsZSB2cmFtIHJlZ2lvbjwvZm9udD4NCjxkaXY+Jm5i
c3A7PC9kaXY+DQo8L2Rpdj4NCjxkaXYgY2xhc3M9IkJvZHlGcmFnbWVudCI+PGZvbnQgc2l6ZT0i
MiI+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMXB0OyI+DQo8ZGl2IGNsYXNzPSJQbGFpblRleHQi
PkFtIDE5LjA4LjE5IHVtIDEwOjA1IHNjaHJpZWIgVGlhbmNpIFlpbjo8YnI+DQomZ3Q7IEZyb206
ICZxdW90O1RpYW5jaS5ZaW4mcXVvdDsgPGEgY2xhc3M9Im1vei10eHQtbGluay1yZmMyMzk2RSIg
aHJlZj0ibWFpbHRvOnRpYW5jaS55aW5AYW1kLmNvbSI+DQombHQ7dGlhbmNpLnlpbkBhbWQuY29t
Jmd0OzwvYT48YnI+DQomZ3Q7PGJyPg0KJmd0OyBzbyB0aGF0IG1vcmUgdmlzaWJsZSB2cmFtIGNh
biBiZSBhdmFpbGFibGUgZm9yIHVtZC48YnI+DQomZ3Q7PGJyPg0KJmd0OyBTaWduZWQtb2ZmLWJ5
OiBUaWFuY2kuWWluIDxhIGNsYXNzPSJtb3otdHh0LWxpbmstcmZjMjM5NkUiIGhyZWY9Im1haWx0
bzp0aWFuY2kueWluQGFtZC5jb20iPg0KJmx0O3RpYW5jaS55aW5AYW1kLmNvbSZndDs8L2E+PGJy
Pg0KPGJyPg0KQXNzdW1pbmcgdGhhdCB5b3UgY2hlY2tlZCB0aGF0IHdlIGRvbid0IGhhdmUgb3Ro
ZXIgdXNlcnMgd2hvIGFyZSB1c2luZyA8YnI+DQphbWRncHVfYm9fY3JlYXRlX2tlcm5lbCgpIHdp
dGhvdXQgYSBDUFUgcG9pbnRlciB0aGlzIHBhdGNoIGlzIDxicj4NClJldmlld2VkLWJ5OiBDaHJp
c3RpYW4gS8O2bmlnIDxhIGNsYXNzPSJtb3otdHh0LWxpbmstcmZjMjM5NkUiIGhyZWY9Im1haWx0
bzpjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20iPg0KJmx0O2NocmlzdGlhbi5rb2VuaWdAYW1kLmNv
bSZndDs8L2E+Ljxicj4NCjxicj4NCiZndDsgLS0tPGJyPg0KJmd0OyZuYnNwOyZuYnNwOyBkcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfb2JqZWN0LmMgfCA1ICYjNDM7JiM0MzsmIzQz
Oy0tPGJyPg0KJmd0OyZuYnNwOyZuYnNwOyBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRn
cHVfcHNwLmMmbmJzcDsmbmJzcDsmbmJzcDsgfCA0ICYjNDM7JiM0MzstLTxicj4NCiZndDsmbmJz
cDsmbmJzcDsgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3BzcC5oJm5ic3A7Jm5i
c3A7Jm5ic3A7IHwgMSAtPGJyPg0KJmd0OyZuYnNwOyZuYnNwOyAzIGZpbGVzIGNoYW5nZWQsIDUg
aW5zZXJ0aW9ucygmIzQzOyksIDUgZGVsZXRpb25zKC0pPGJyPg0KJmd0Ozxicj4NCiZndDsgZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9vYmplY3QuYyBiL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9vYmplY3QuYzxicj4NCiZndDsgaW5kZXgg
MTA1OTc3MS4uMDQ3Njc5MCAxMDA2NDQ8YnI+DQomZ3Q7IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2FtZGdwdV9vYmplY3QuYzxicj4NCiZndDsgJiM0MzsmIzQzOyYjNDM7IGIvZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X29iamVjdC5jPGJyPg0KJmd0OyBAQCAtMjQ2
LDggJiM0MzsyNDYsOSBAQCBpbnQgYW1kZ3B1X2JvX2NyZWF0ZV9yZXNlcnZlZChzdHJ1Y3QgYW1k
Z3B1X2RldmljZSAqYWRldiw8YnI+DQomZ3Q7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7
Jm5ic3A7Jm5ic3A7IGJwLnNpemUgPSBzaXplOzxicj4NCiZndDsmbmJzcDsmbmJzcDsmbmJzcDsm
bmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsgYnAuYnl0ZV9hbGlnbiA9IGFsaWduOzxicj4NCiZndDsm
bmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsgYnAuZG9tYWluID0gZG9t
YWluOzxicj4NCiZndDsgLSZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyBicC5mbGFncyA9IEFNREdQ
VV9HRU1fQ1JFQVRFX0NQVV9BQ0NFU1NfUkVRVUlSRUQgfDxicj4NCiZndDsgLSZuYnNwOyZuYnNw
OyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZu
YnNwOyBBTURHUFVfR0VNX0NSRUFURV9WUkFNX0NPTlRJR1VPVVM7PGJyPg0KJmd0OyAmIzQzOyZu
YnNwOyZuYnNwOyZuYnNwOyZuYnNwOyBicC5mbGFncyA9IGNwdV9hZGRyID8gQU1ER1BVX0dFTV9D
UkVBVEVfQ1BVX0FDQ0VTU19SRVFVSVJFRDxicj4NCiZndDsgJiM0MzsmbmJzcDsmbmJzcDsmbmJz
cDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsg
OiBBTURHUFVfR0VNX0NSRUFURV9OT19DUFVfQUNDRVNTOzxicj4NCiZndDsgJiM0MzsmbmJzcDsm
bmJzcDsmbmJzcDsmbmJzcDsgYnAuZmxhZ3MgfD0gQU1ER1BVX0dFTV9DUkVBVEVfVlJBTV9DT05U
SUdVT1VTOzxicj4NCiZndDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJz
cDsgYnAudHlwZSA9IHR0bV9ib190eXBlX2tlcm5lbDs8YnI+DQomZ3Q7Jm5ic3A7Jm5ic3A7Jm5i
c3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7IGJwLnJlc3YgPSBOVUxMOzxicj4NCiZndDsmbmJz
cDsmbmJzcDsgPGJyPg0KJmd0OyBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvYW1kZ3B1X3BzcC5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3BzcC5j
PGJyPg0KJmd0OyBpbmRleCA3NzE1YzBkLi41ZTdmYmJlIDEwMDY0NDxicj4NCiZndDsgLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3BzcC5jPGJyPg0KJmd0OyAmIzQzOyYj
NDM7JiM0MzsgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcHNwLmM8YnI+DQom
Z3Q7IEBAIC0yNjQsNyAmIzQzOzI2NCw3IEBAIHN0YXRpYyBpbnQgcHNwX3Rtcl9pbml0KHN0cnVj
dCBwc3BfY29udGV4dCAqcHNwKTxicj4NCiZndDsmbmJzcDsmbmJzcDsgPGJyPg0KJmd0OyZuYnNw
OyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyByZXQgPSBhbWRncHVfYm9fY3Jl
YXRlX2tlcm5lbChwc3AtJmd0O2FkZXYsIHRtcl9zaXplLCBQU1BfVE1SX1NJWkUsPGJyPg0KJmd0
OyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZu
YnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNw
OyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZu
YnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyBBTURH
UFVfR0VNX0RPTUFJTl9WUkFNLDxicj4NCiZndDsgLSZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZu
YnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNw
OyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZu
YnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNw
OyZuYnNwOyAmYW1wO3BzcC0mZ3Q7dG1yX2JvLCAmYW1wO3BzcC0mZ3Q7dG1yX21jX2FkZHIsICZh
bXA7cHNwLSZndDt0bXJfYnVmKTs8YnI+DQomZ3Q7ICYjNDM7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5i
c3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7
Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5i
c3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7
Jm5ic3A7Jm5ic3A7ICZhbXA7cHNwLSZndDt0bXJfYm8sICZhbXA7cHNwLSZndDt0bXJfbWNfYWRk
ciwgTlVMTCk7PGJyPg0KJmd0OyZuYnNwOyZuYnNwOyA8YnI+DQomZ3Q7Jm5ic3A7Jm5ic3A7Jm5i
c3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7IHJldHVybiByZXQ7PGJyPg0KJmd0OyZuYnNwOyZu
YnNwOyB9PGJyPg0KJmd0OyBAQCAtMTIxNSw3ICYjNDM7MTIxNSw3IEBAIHN0YXRpYyBpbnQgcHNw
X2h3X2Zpbmkodm9pZCAqaGFuZGxlKTxicj4NCiZndDsmbmJzcDsmbmJzcDsgPGJyPg0KJmd0OyZu
YnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyBwc3BfcmluZ19kZXN0cm95
KHBzcCwgUFNQX1JJTkdfVFlQRV9fS00pOzxicj4NCiZndDsmbmJzcDsmbmJzcDsgPGJyPg0KJmd0
OyAtJm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7IGFtZGdwdV9ib19mcmVlX2tlcm5lbCgmYW1wO3Bz
cC0mZ3Q7dG1yX2JvLCAmYW1wO3BzcC0mZ3Q7dG1yX21jX2FkZHIsICZhbXA7cHNwLSZndDt0bXJf
YnVmKTs8YnI+DQomZ3Q7ICYjNDM7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7IGFtZGdwdV9ib19m
cmVlX2tlcm5lbCgmYW1wO3BzcC0mZ3Q7dG1yX2JvLCAmYW1wO3BzcC0mZ3Q7dG1yX21jX2FkZHIs
IE5VTEwpOzxicj4NCiZndDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJz
cDsgYW1kZ3B1X2JvX2ZyZWVfa2VybmVsKCZhbXA7cHNwLSZndDtmd19wcmlfYm8sPGJyPg0KJmd0
OyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZu
YnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNw
OyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZu
YnNwOyAmYW1wO3BzcC0mZ3Q7ZndfcHJpX21jX2FkZHIsICZhbXA7cHNwLSZndDtmd19wcmlfYnVm
KTs8YnI+DQomZ3Q7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7IGFt
ZGdwdV9ib19mcmVlX2tlcm5lbCgmYW1wO3BzcC0mZ3Q7ZmVuY2VfYnVmX2JvLDxicj4NCiZndDsg
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9wc3AuaCBiL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9wc3AuaDxicj4NCiZndDsgaW5kZXggMDAy
OWZhMi4uNDhiMDU3ZCAxMDA2NDQ8YnI+DQomZ3Q7IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L2FtZGdwdV9wc3AuaDxicj4NCiZndDsgJiM0MzsmIzQzOyYjNDM7IGIvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3BzcC5oPGJyPg0KJmd0OyBAQCAtMTcyLDcgJiM0Mzsx
NzIsNiBAQCBzdHJ1Y3QgcHNwX2NvbnRleHQ8YnI+DQomZ3Q7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5i
c3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7IC8qIHRtciBidWZmZXIgKi88YnI+DQomZ3Q7Jm5ic3A7Jm5i
c3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7IHN0cnVjdCBhbWRncHVfYm8mbmJzcDsm
bmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJz
cDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsgKnRtcl9ibzs8YnI+DQomZ3Q7Jm5ic3A7Jm5ic3A7
Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7IHVpbnQ2NF90Jm5ic3A7Jm5ic3A7Jm5ic3A7
Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5i
c3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7
Jm5ic3A7IHRtcl9tY19hZGRyOzxicj4NCiZndDsgLSZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyB2
b2lkJm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7
Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5i
c3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7ICp0bXJf
YnVmOzxicj4NCiZndDsmbmJzcDsmbmJzcDsgPGJyPg0KJmd0OyZuYnNwOyZuYnNwOyZuYnNwOyZu
YnNwOyZuYnNwOyZuYnNwOyZuYnNwOyAvKiBhc2QgZmlybXdhcmUgYW5kIGJ1ZmZlciAqLzxicj4N
CiZndDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsgY29uc3Qgc3Ry
dWN0IGZpcm13YXJlJm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5i
c3A7Jm5ic3A7Jm5ic3A7ICphc2RfZnc7PGJyPg0KPGJyPg0KPC9kaXY+DQo8L3NwYW4+PC9mb250
PjwvZGl2Pg0KPC9ibG9ja3F1b3RlPg0KPGJyPg0KPC9ib2R5Pg0KPC9odG1sPg0K

--_000_d0ddbe800f7f046d94f11620865b07c8amdcom_--

--===============0704697644==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============0704697644==--
