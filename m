Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B4DFA83B1
	for <lists+amd-gfx@lfdr.de>; Wed,  4 Sep 2019 15:23:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F527898A3;
	Wed,  4 Sep 2019 13:23:08 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680047.outbound.protection.outlook.com [40.107.68.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74ADC898A3
 for <amd-gfx@lists.freedesktop.org>; Wed,  4 Sep 2019 13:23:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YaWa0e9F9d+pOwAP87ddkaLjQ0ZQcuH+xImGgH/y0KNE9QFOO9AW2oyAmsJMw7WRGqRCkMjScQGgAiQ53Z9Pigsg2JkNnpfHU4DHLEMqqPJ1EEt6Z8ix9Tn8rPGuwpmKG++3vPPfaQzBFY13tCPnFd/wQGcHkYAbLPtJAZ8nHAa68d5CGk1UyMEX9gdRECjGSf824lKfhpvW+zKcY5zTY5J1RCmwXsFwAQMFU1scU5kYyTJJ+reZqcRqSxZnS/fhkiXHc+jUvy8VCmd9RGFuIQ9SpXmVRSWAPUpels1MMDqyRoV0ioXfKJ1VQI3K3VzoaMuTiVk8NJ6OCqKf4gKLLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OWvfZgdj2CBsflIb8j9hIS5rYeEIvrMx+1fLFzhxxmU=;
 b=UYCRuuKZMmrDoWy5JEH8FLY0MfBHW6iDPNbBOhHZa33lK9XtWq6Zbg/JXOZdWfnZ3nH3/IYAvVucRZrwhTdqxDNUJK9oo0vPL0yKJgRfGDBetXi2R7ngvu5RPp6/rkiVNYIqEh8tg9PB6KKS9w33Ia42m7Y7uZKDcVXJAZ+BH0tZdINdEdq0yiZgEtsbY8jlZedLGPlD+QhNRmqqjRxJoHlPe7lSTH4HBby4cyzyJVppRnIZrUwv+uLJiYV6TY2XjdsMj0AfszehoBwQJF9qqqIbkAanS18g0loJpxcshC4zs/AxHQNLgniSvZCeRHzN3d4Rkotc3y6Arygro+ffcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CY4PR1201MB0230.namprd12.prod.outlook.com (10.172.79.7) by
 CY4PR1201MB0119.namprd12.prod.outlook.com (10.172.79.19) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2220.20; Wed, 4 Sep 2019 13:23:02 +0000
Received: from CY4PR1201MB0230.namprd12.prod.outlook.com
 ([fe80::708e:c826:5b05:e3f0]) by CY4PR1201MB0230.namprd12.prod.outlook.com
 ([fe80::708e:c826:5b05:e3f0%11]) with mapi id 15.20.2220.022; Wed, 4 Sep 2019
 13:23:02 +0000
From: Harry Wentland <hwentlan@amd.com>
To: "Liu, Aaron" <Aaron.Liu@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 1/2] drm/amd/display: bypass stereo programming
Thread-Topic: [PATCH 1/2] drm/amd/display: bypass stereo programming
Thread-Index: AQHVYubfbbI+ljBsaE6+Y+P6GYbj06cbgfEA
Date: Wed, 4 Sep 2019 13:23:02 +0000
Message-ID: <e97ec062-028e-dff8-8d27-b874ca6f51f5@amd.com>
References: <1567577166-18064-1-git-send-email-aaron.liu@amd.com>
In-Reply-To: <1567577166-18064-1-git-send-email-aaron.liu@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.250]
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-clientproxiedby: YTXPR0101CA0054.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:1::31) To CY4PR1201MB0230.namprd12.prod.outlook.com
 (2603:10b6:910:1e::7)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ff80a24d-0c50-4468-6806-08d7313b033d
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:CY4PR1201MB0119; 
x-ms-traffictypediagnostic: CY4PR1201MB0119:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CY4PR1201MB01199ECA563310A7454761968CB80@CY4PR1201MB0119.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-forefront-prvs: 0150F3F97D
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(39860400002)(346002)(376002)(136003)(366004)(189003)(199004)(486006)(6116002)(256004)(66946007)(66446008)(64756008)(66556008)(66476007)(99286004)(52116002)(31686004)(5660300002)(25786009)(71200400001)(316002)(71190400001)(58126008)(110136005)(36756003)(65806001)(66066001)(6436002)(478600001)(6486002)(2501003)(8936002)(8676002)(6246003)(26005)(65956001)(11346002)(6506007)(53546011)(102836004)(386003)(76176011)(7736002)(31696002)(186003)(14454004)(229853002)(446003)(3846002)(4326008)(6512007)(53936002)(2616005)(54906003)(81166006)(81156014)(2906002)(476003)(305945005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR1201MB0119;
 H:CY4PR1201MB0230.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 7yOCzkeRO/MlC8A7PAfuQmWxyAQZITd5aYEydADFCeS+0LIeC/qIF2VkSiwjN41xZ8WwiN45W4kaHvIx83f7NrCT+pTacfQwMEOEnC9h26mNEYfTioSk0qePnRKxfJ4FisMKq8fbaIYm7U8jWbP7g0185n8mq9i6ycuM1nGVXz+3PZhr5BOibmEc1kPCOYX+SR5rD0XQli6kiKjD1G5kyTMdWBKa3zp+DmC+mNTR1TZBsL8TlCwrFv1p2D9LNWG2o3Vjgun7PA98g9whMJn1ipxNyuFi3D5TPQTww0keT4vsDt9wZTGAUx33fascMBUAYqoz8bx060J18YUyRlhA6RKnHk0D1m5RxrEVrb1egtie/ErfF4TJPP0F6hCCyIkEcirMoN67WJb/YjE7WOl+OAnUrR7kQTJ9g+SwgvlVYRE=
Content-ID: <6E1370A9AE9EF948AD348FFC54E22314@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ff80a24d-0c50-4468-6806-08d7313b033d
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Sep 2019 13:23:02.5361 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UrHS2n1krJCN9j7BZqTbOzg1c5j/XFuFJWt05MfTmQLX2fFiOtvYXXlt5Z6tfGVEZs4Tv1iImEQgnOnNHSmgmA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB0119
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OWvfZgdj2CBsflIb8j9hIS5rYeEIvrMx+1fLFzhxxmU=;
 b=xQDAFJrLnyLWNLwUf8BOfx2dOUnz7BOkBy8wcCTgoV8PBc5TdPZw7iY+BaVmZ/IS/33HGZybjj+YjtTF0OgP/lhc5HpY7NEYYfeSKmHn6S43kPN6YuSX9iOmPtTGykCZ75HAgzKyME+CvWQBuelBKhQA7NDEP92zcaOJcD4+p2g=
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Huang,
 Ray" <Ray.Huang@amd.com>, "Li, Roman" <Roman.Li@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gMjAxOS0wOS0wNCAyOjA2IGEubS4sIExpdSwgQWFyb24gd3JvdGU6DQo+IEZyb206IFJvbWFu
IExpIDxSb21hbi5MaUBhbWQuY29tPg0KPiANCj4gaGFjayB0byBhdm9pZCBjcmFzaCBvbiByZW5v
aXINCj4gc2hvdWxkIGJlIHJlc29sdmVkIGFmdGVyIHVwY29taW5nIGdwaW8gcmVmYWN0b3Jpbmcg
cHJvbW90aW9uDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBSb21hbiBMaSA8Um9tYW4uTGlAYW1kLmNv
bT4NCg0KTmFjay4gVGhpcyBpcyBub3QgdGhlIHJpZ2h0IHdheSB0byBkbyB0aGlzIHVwc3RyZWFt
LiBXZSBzaG91bGRuJ3QgdXNlDQpjb21waWxlIHRpbWUgZ3VhcmQgdG8gY2hhbmdlIEFTSUMgYmVo
YXZpb3IuIFRoaXMgaXMgYSBicmluZ3VwLWJyYW5jaA0KY2hhbmdlIGFuZCBuZWVkcyB0byBiZSBy
ZXZpc2l0ZWQgZm9yIGFtZC1zdGcuDQoNCkhhcnJ5DQoNCj4gLS0tDQo+ICBkcml2ZXJzL2dwdS9k
cm0vYW1kL2Rpc3BsYXkvZGMvZGNuMTAvZGNuMTBfaHdfc2VxdWVuY2VyLmMgfCA2ICsrKysrKw0K
PiAgMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24xMC9kY24xMF9od19zZXF1ZW5jZXIuYyBi
L2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24xMC9kY24xMF9od19zZXF1ZW5jZXIu
Yw0KPiBpbmRleCA1YjlkZDE2Li5lZTIxODZjIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9k
cm0vYW1kL2Rpc3BsYXkvZGMvZGNuMTAvZGNuMTBfaHdfc2VxdWVuY2VyLmMNCj4gKysrIGIvZHJp
dmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjEwL2RjbjEwX2h3X3NlcXVlbmNlci5jDQo+
IEBAIC0yODQ0LDYgKzI4NDQsMTIgQEAgc3RhdGljIHZvaWQgZGNuMTBfc2V0dXBfc3RlcmVvKHN0
cnVjdCBwaXBlX2N0eCAqcGlwZV9jdHgsIHN0cnVjdCBkYyAqZGMpDQo+ICB7DQo+ICAJc3RydWN0
IGNydGNfc3RlcmVvX2ZsYWdzIGZsYWdzID0geyAwIH07DQo+ICAJc3RydWN0IGRjX3N0cmVhbV9z
dGF0ZSAqc3RyZWFtID0gcGlwZV9jdHgtPnN0cmVhbTsNCj4gKyNpZmRlZiBDT05GSUdfRFJNX0FN
RF9EQ19EQ04yXzENCj4gKy8qIFRPRE86IHJlbW92ZSBhZnRlciBncGlvIHJlZmFjdG9yIGdldHMg
cHJvbW90ZWQNCj4gKyogICAgICAgIG90aGVyd2lzZSBpdCBjYXVzaW5nIGNyYXNoIG9uIFJlbm9p
cg0KPiArKi8NCj4gKwlyZXR1cm47DQo+ICsjZW5kaWYNCj4gIA0KPiAgCWRjbjEwX2NvbmZpZ19z
dGVyZW9fcGFyYW1ldGVycyhzdHJlYW0sICZmbGFncyk7DQo+ICANCj4gDQpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAph
bWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
