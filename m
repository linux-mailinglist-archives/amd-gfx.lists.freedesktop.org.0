Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F656976BA
	for <lists+amd-gfx@lfdr.de>; Wed, 21 Aug 2019 12:13:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA7896E27F;
	Wed, 21 Aug 2019 10:13:15 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr720075.outbound.protection.outlook.com [40.107.72.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2CCB6E27F
 for <amd-gfx@lists.freedesktop.org>; Wed, 21 Aug 2019 10:13:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ljuEvjmwPhxWnzgHqjm/5IEebxFYlkz54VthHEFjC6gT1sX1blt88Xyuqhh3MAY5Go25t145Ial9/WKjWYZ/U/4/X+Rc31CtOmn9SyveMX9p4IC+ddDuns93xb+fgNc5tLMc1x1kzIJkeN/9gcGKwtpikMBRlqvS5BUsQu4h/tz5xr84FgPNcMzQQf/iwH7MCG4jWiR1rk5MWQEYfd0O5SDA8Rly+NVBR0LKmjS/oIrhZYjImY9L4TPsfmJja7yViSJVlRjxXj4bR7frAY+vvdkwH/VduZmlE0lKhG9stn2aarBnjt7sTwr7UwXC3xVHWJ/EHIEwBdwPJ6dB7CYSUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SmPg4Vzgp2afB0S1qcgI25WaIX7tcXCRNf0iEXdJAYE=;
 b=edQIzwEYPF1v/sgz83/4Qi0Z6g1EqnNOyROnIYL6gG3NnoF70Z/P05OBzaq73S6NOdauFEbMpDlspB6NSftdkVEwR0nFtj+hh8LBGNffblFLNKVhz/pG0nprWR6dRlGycEBJwGv0TwSKaofwsic4k0jS4laUwMrFvlk3Eyjqec2STkbNwMgj65fggn9Z8yWK+0WhwAlWNgEpNJGaOwYWX8g0D9c9uGl7MqAhYpxEp58BPM3xHJLkm558/S4jEzrQereFcq4daGOx0DmBFMN0ABMyvilUIlmBMXq2ta/LZzNtQmkOjTLvfg7rG2My9QMhc8Sfd3HD8Cd3qdyVHW/0dw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB2975.namprd12.prod.outlook.com (20.178.243.142) by
 MN2PR12MB3950.namprd12.prod.outlook.com (10.255.238.151) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.18; Wed, 21 Aug 2019 10:13:13 +0000
Received: from MN2PR12MB2975.namprd12.prod.outlook.com
 ([fe80::60ad:404b:ae0c:7bb9]) by MN2PR12MB2975.namprd12.prod.outlook.com
 ([fe80::60ad:404b:ae0c:7bb9%7]) with mapi id 15.20.2178.018; Wed, 21 Aug 2019
 10:13:13 +0000
From: "Deng, Emily" <Emily.Deng@amd.com>
To: "Min, Frank" <Frank.Min@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH 1/2] drm/amdgpu: unity mc base address for arcturus
Thread-Topic: [PATCH 1/2] drm/amdgpu: unity mc base address for arcturus
Thread-Index: AQHVWAdQQjC80kzkwEmVSYL3PfEKtacFYdOQ
Date: Wed, 21 Aug 2019 10:13:13 +0000
Message-ID: <MN2PR12MB2975394CBB7146F63C489B0E8FAA0@MN2PR12MB2975.namprd12.prod.outlook.com>
References: <1566381635-6484-1-git-send-email-Frank.Min@amd.com>
In-Reply-To: <1566381635-6484-1-git-send-email-Frank.Min@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 355b247c-d563-477e-e98c-08d726202d48
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3950; 
x-ms-traffictypediagnostic: MN2PR12MB3950:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB39505A2EFBDB9A6B087DF2C28FAA0@MN2PR12MB3950.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-forefront-prvs: 0136C1DDA4
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(396003)(366004)(376002)(346002)(136003)(189003)(199004)(13464003)(64756008)(66476007)(74316002)(66066001)(99286004)(3846002)(6436002)(8936002)(9686003)(6116002)(229853002)(6506007)(25786009)(53936002)(81166006)(256004)(4326008)(6246003)(71200400001)(110136005)(55016002)(316002)(7696005)(76176011)(71190400001)(33656002)(66946007)(476003)(305945005)(76116006)(8676002)(478600001)(52536014)(2906002)(6306002)(26005)(7736002)(186003)(5660300002)(2501003)(446003)(11346002)(81156014)(66446008)(14454004)(486006)(102836004)(66556008)(86362001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3950;
 H:MN2PR12MB2975.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: SDXZLphnub/cJbWkFfNLp64q5yfNw1SMKm23eferO1OMn6aw3yv9wWsReL79SFaOosQ1I1d7LKKBbHQ+5MXqFNtopnUPx7ntGE+eFfZd9TU9gM3glGuHx5BLhU6YtrjWBwijmGFWNsZpjYGrluWxWb/ntuzMP1UPBgs7mUGQymjtFiiVjPCwpHcdvHPS3J7KtSDEJKcdKzP3IvBluJUVKJ27JN3XM4WQTPRr1yYF8m6pA3EVrf8MZTI9swhC8V83k8i55FP2/enVC09i8fWMXfuC2LCu5H4ptsVhXb9G8sdF/VWhCJ/whT7VAehRIMrv13U01uOHak0JVzs1FINlEEinDv779LsHcIaHkSefQLo5DoHvKrrPLsdKFILAGkQCHA6/2srfRwwqTSmm+iDmv3+iCDTvFp4OSzFOsJSEsS8=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 355b247c-d563-477e-e98c-08d726202d48
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Aug 2019 10:13:13.5507 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SlzdG1DPqA8ir63Bzhw8bVmDg35YEOWC0Z6/d+Yl2b2gyBJXxaRg8FpGBALWfz7u
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3950
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SmPg4Vzgp2afB0S1qcgI25WaIX7tcXCRNf0iEXdJAYE=;
 b=oS7q4tBLLunrW6aaP6jQZO66tD4mjLhmpyM1xxMd1uSVWVU+0yKhVEy3rQBj6UwVrChX5eoC+IjwDFPOJXcXtl/1+cZxMpW+zVM8srGQGGqadHbYwg9Rp58ucdc/3XwDdb94pQ8lTTAwu756Qcse6TvccSH//bMQTmpH+ZzC0lg=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Emily.Deng@amd.com; 
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
Cc: "Min, Frank" <Frank.Min@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

U2VyaWVzIA0KUmV2aWV3ZWQtYnk6IEVtaWx5IERlbmcgPEVtaWx5LkRlbmdAYW1kLmNvbT4NCg0K
Pi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+RnJvbTogYW1kLWdmeCA8YW1kLWdmeC1ib3Vu
Y2VzQGxpc3RzLmZyZWVkZXNrdG9wLm9yZz4gT24gQmVoYWxmIE9mDQo+RnJhbmsuTWluDQo+U2Vu
dDogV2VkbmVzZGF5LCBBdWd1c3QgMjEsIDIwMTkgNjowMSBQTQ0KPlRvOiBhbWQtZ2Z4QGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZw0KPkNjOiBNaW4sIEZyYW5rIDxGcmFuay5NaW5AYW1kLmNvbT4NCj5T
dWJqZWN0OiBbUEFUQ0ggMS8yXSBkcm0vYW1kZ3B1OiB1bml0eSBtYyBiYXNlIGFkZHJlc3MgZm9y
IGFyY3R1cnVzDQo+DQo+YXJjdHVydXMgZm9yIHNyaW92IHdvdWxkIHVzZSB0aGUgdW5pZmllZCBt
YyBiYXNlIGFkZHJlc3MNCj4NCj5DaGFuZ2UtSWQ6IEkzZjEwZjg4ODc3YWEzODE0NWEyNTliODhj
MTFhNmFhMjMyOWYzZmUyDQo+LS0tDQo+IGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dtY192
OV8wLmMgfCAxMiArKysrKystLS0tLS0NCj4gMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygr
KSwgNiBkZWxldGlvbnMoLSkNCj4NCj5kaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvZ21jX3Y5XzAuYw0KPmIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ21jX3Y5XzAu
Yw0KPmluZGV4IDZkZTE3MjYuLjY4M2Y0N2QgMTAwNjQ0DQo+LS0tIGEvZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvZ21jX3Y5XzAuYw0KPisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L2dtY192OV8wLmMNCj5AQCAtOTIwLDEyICs5MjAsMTIgQEAgc3RhdGljIHZvaWQgZ21jX3Y5XzBf
dnJhbV9ndHRfbG9jYXRpb24oc3RydWN0DQo+YW1kZ3B1X2RldmljZSAqYWRldiwNCj4gCQkJCQlz
dHJ1Y3QgYW1kZ3B1X2dtYyAqbWMpDQo+IHsNCj4gCXU2NCBiYXNlID0gMDsNCj4tCWlmICghYW1k
Z3B1X3NyaW92X3ZmKGFkZXYpKSB7DQo+LQkJaWYgKGFkZXYtPmFzaWNfdHlwZSA9PSBDSElQX0FS
Q1RVUlVTKQ0KPi0JCQliYXNlID0gbW1odWJfdjlfNF9nZXRfZmJfbG9jYXRpb24oYWRldik7DQo+
LQkJZWxzZQ0KPi0JCQliYXNlID0gbW1odWJfdjFfMF9nZXRfZmJfbG9jYXRpb24oYWRldik7DQo+
LQl9DQo+Kw0KPisJaWYgKGFkZXYtPmFzaWNfdHlwZSA9PSBDSElQX0FSQ1RVUlVTKQ0KPisJCWJh
c2UgPSBtbWh1Yl92OV80X2dldF9mYl9sb2NhdGlvbihhZGV2KTsNCj4rCWVsc2UgaWYgKCFhbWRn
cHVfc3Jpb3ZfdmYoYWRldikpDQo+KwkJYmFzZSA9IG1taHViX3YxXzBfZ2V0X2ZiX2xvY2F0aW9u
KGFkZXYpOw0KPisNCj4gCS8qIGFkZCB0aGUgeGdtaSBvZmZzZXQgb2YgdGhlIHBoeXNpY2FsIG5v
ZGUgKi8NCj4gCWJhc2UgKz0gYWRldi0+Z21jLnhnbWkucGh5c2ljYWxfbm9kZV9pZCAqIGFkZXYt
DQo+PmdtYy54Z21pLm5vZGVfc2VnbWVudF9zaXplOw0KPiAJYW1kZ3B1X2dtY192cmFtX2xvY2F0
aW9uKGFkZXYsIG1jLCBiYXNlKTsNCj4tLQ0KPjIuNy40DQo+DQo+X19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18NCj5hbWQtZ2Z4IG1haWxpbmcgbGlzdA0KPmFt
ZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4DQpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2FtZC1nZng=
