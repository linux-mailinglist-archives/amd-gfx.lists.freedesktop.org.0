Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C0C19E35A
	for <lists+amd-gfx@lfdr.de>; Tue, 27 Aug 2019 10:56:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C6FD89241;
	Tue, 27 Aug 2019 08:56:46 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr740078.outbound.protection.outlook.com [40.107.74.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AB8889241
 for <amd-gfx@lists.freedesktop.org>; Tue, 27 Aug 2019 08:56:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DltdMeSNdFY/Q+nMXghtiR+vHjkOo66NYTDGDtHGEI0nCYvdNlxmoZVKcwlexc7IN2Ow73M0p4vOT51KtrOXdAcFqlBuhUulhDsXRdLiMgTMeNhk5qTMiZL5SPzuA6i9aVX4EbmZuiGnS45zSRWof0lyztT/FDD8He2pR7vKlsIIze3uDkWw5YaEl15pAiFAlT3mGsrkR4kwgYOA+I2nfjUn0grWquOKPjD/2e4YD+tJvZNXl+TD9UKdFVhoGJInLr0dzRasE7yruJNh2d8J9v0s+6VG3opFihTfvmibxAxClRp7jmPz+1RLl/ly/Xj4ZOsaAgi3V/q/BRg+4IkJew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XPr9jBDrbREGT/tTMi2I26ffA+8Vdvhz2IxbQHKwCHI=;
 b=YsWwod9tb32no/XBYNqT1Hmkjf64XbUhhYqUJ3JkA7esmtJQxrH0jj3viEcfUfUUJS3cck1atxBwyY+cNHXYwrlMzwsu6/KDV1UDRTIDRQqTsSKLs7c8uEeuawZ6lEDLGT5zu4kxyMK3Wy1nZPT9fIV8THMj/Zr4BjFHg/e1lSwg8OlP11JxwKGezE8F7nAhOi1zWvYfByo+/RbsViSR5U3UyGaQau38uDTpF7WuHu4YEe7ddnJ47Xqxo2m3t/9Xp4z1QDRWCsXonvx8WpGGAWFTBnVa3ADo/WHW0isyOkxVSrifxc2MQ4ut7+n4UW9X+ww79cO+JQWIZcV8u6RaPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM5PR12MB1705.namprd12.prod.outlook.com (10.175.88.22) by
 DM5PR12MB2405.namprd12.prod.outlook.com (52.132.141.22) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.18; Tue, 27 Aug 2019 08:56:42 +0000
Received: from DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::a129:1f1a:52a9:4ac3]) by DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::a129:1f1a:52a9:4ac3%5]) with mapi id 15.20.2199.021; Tue, 27 Aug 2019
 08:56:42 +0000
From: "Koenig, Christian" <Christian.Koenig@amd.com>
To: "Kuehling, Felix" <Felix.Kuehling@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 1/4] drm/amdgpu: Extends amdgpu vm definitions (v2)
Thread-Topic: [PATCH 1/4] drm/amdgpu: Extends amdgpu vm definitions (v2)
Thread-Index: AQHVXGL9O07buUE9QE2RgfHgFt0WqKcOseKA
Date: Tue, 27 Aug 2019 08:56:41 +0000
Message-ID: <00cc4c17-b005-f2b1-3a6b-38903dd0a579@amd.com>
References: <20190826230355.25007-1-Felix.Kuehling@amd.com>
In-Reply-To: <20190826230355.25007-1-Felix.Kuehling@amd.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-originating-ip: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
x-clientproxiedby: PR0P264CA0226.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1e::22) To DM5PR12MB1705.namprd12.prod.outlook.com
 (2603:10b6:3:10c::22)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a19c12da-3ada-4736-c28e-08d72acc7a5c
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM5PR12MB2405; 
x-ms-traffictypediagnostic: DM5PR12MB2405:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR12MB24050598F1539CE4FDFEE0BC83A00@DM5PR12MB2405.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 0142F22657
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(366004)(346002)(39860400002)(396003)(376002)(189003)(199004)(256004)(478600001)(6436002)(6512007)(6486002)(6246003)(65806001)(53936002)(476003)(229853002)(36756003)(6116002)(31696002)(14454004)(65956001)(52116002)(71190400001)(2501003)(71200400001)(7736002)(99286004)(446003)(11346002)(5660300002)(486006)(2906002)(81166006)(110136005)(58126008)(186003)(8676002)(316002)(81156014)(46003)(8936002)(102836004)(6506007)(86362001)(4326008)(66476007)(66446008)(64756008)(66556008)(76176011)(66946007)(31686004)(305945005)(25786009)(386003)(2616005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB2405;
 H:DM5PR12MB1705.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: O468A21UOO5JjGJ3PjY6lf8Nr+dVhvhKRXrKUqdOqZQGgoggthSg9WAcrYpppRxPGvTUowr1Hix2dkiCRMru5kv0ssKRdBt2UpIuA9x2NWmQkptIp7hEgXxvGlJYA6FFPUfLP77aCYYuCdddQB+/7eS5FOKsBGMEOhMCRtKr/Yp2ReDj2P9+W2fzaAtHE4WG2hfShrzpHjeef87TL6DeTQ7PJsN8OVgmKUszxg8PXtT0zpqbFUh+a9baAg3s5alvJYIWQGvdBjJtZqmel1q1wt2kEFfdfOE5KUmKKZlZgVDzKvlHw8TkJS9XqvVrShNdWBGX4z+zgO7wc4oF1znU/4edPuJCigUoejiHsMoniNdvgGNUskMaNxoBWsIAUQxf5ewRGXRqkxXMehjDK9KEEsIgZ5cdsBKApF4o+DtcYGY=
Content-ID: <190054408E354740830DE6EFCB0B1959@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a19c12da-3ada-4736-c28e-08d72acc7a5c
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Aug 2019 08:56:42.0574 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QAHdeGTWwpbgrNjt8vCUu6kFT1JzmHK9xrNmLR7CrUSOb1ogr4WDIaLU5KUwNJKx
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB2405
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XPr9jBDrbREGT/tTMi2I26ffA+8Vdvhz2IxbQHKwCHI=;
 b=RWQeYUNu8CS/E7x4euFP3bCpcew3J6VS5Kq+WKxi2h4z1NmxzXhJcatNaV7F6R3yIEjYm4UxuDfw5jRNCHlegIfY2APavGlZ4pTMMt7yy1uXSZAOzJL2oTpXPJowFgNHxBRQcr9sXUwLKhWXpZpGhtedhuMReBG65YUAyPop288=
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
Cc: "Zeng, Oak" <Oak.Zeng@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

QW0gMjcuMDguMTkgdW0gMDE6MDcgc2NocmllYiBLdWVobGluZywgRmVsaXg6DQo+IEZyb206IE9h
ayBaZW5nIDxPYWsuWmVuZ0BhbWQuY29tPg0KPg0KPiBBZGQgUlcgbXR5cGUgaW50cm9kdWNlZCBm
b3IgYXJjdHVydXMuDQo+DQo+IHYyOg0KPiAqIERvbid0IGFkZCBwcm9iZS1pbnZhbGlkYXRpb24g
Yml0IGZyb20gVUFQSQ0KPiAqIERvbid0IGFkZCB1bnVzZWQgQU1ER1BVX01UWVBFXyBkZWZpbml0
aW9ucw0KPg0KPiBTaWduZWQtb2ZmLWJ5OiBPYWsgWmVuZyA8T2FrLlplbmdAYW1kLmNvbT4NCj4g
U2lnbmVkLW9mZi1ieTogRmVsaXggS3VlaGxpbmcgPEZlbGl4Lkt1ZWhsaW5nQGFtZC5jb20+DQoN
CldlIHNob3VsZCBoYXZlIHVzZWQgdGhlIGhhcmR3YXJlIHZhbHVlIGhlcmUgaW4gdGhlIGZpcnN0
IHBsYWNlIChlLmcuIGEgDQptYXNrIGFuZCBhIHNoaWZ0KSwgYnV0IG5vdyBpdCBpcyBwcm9iYWJs
eSB0byBsYXRlIHRvIGFjdHVhbGx5IGZpeCB0aGF0Lg0KDQpSZXZpZXdlZC1ieTogQ2hyaXN0aWFu
IEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPg0KDQo+IC0tLQ0KPiAgIGluY2x1ZGUv
dWFwaS9kcm0vYW1kZ3B1X2RybS5oIHwgMiArKw0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2Vy
dGlvbnMoKykNCj4NCj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvdWFwaS9kcm0vYW1kZ3B1X2RybS5o
IGIvaW5jbHVkZS91YXBpL2RybS9hbWRncHVfZHJtLmgNCj4gaW5kZXggY2E5N2I2ODAyMjc1Li5m
M2FkNDI5MTczZTMgMTAwNjQ0DQo+IC0tLSBhL2luY2x1ZGUvdWFwaS9kcm0vYW1kZ3B1X2RybS5o
DQo+ICsrKyBiL2luY2x1ZGUvdWFwaS9kcm0vYW1kZ3B1X2RybS5oDQo+IEBAIC01MDMsNiArNTAz
LDggQEAgc3RydWN0IGRybV9hbWRncHVfZ2VtX29wIHsNCj4gICAjZGVmaW5lIEFNREdQVV9WTV9N
VFlQRV9DQwkJKDMgPDwgNSkNCj4gICAvKiBVc2UgVUMgTVRZUEUgaW5zdGVhZCBvZiBkZWZhdWx0
IE1UWVBFICovDQo+ICAgI2RlZmluZSBBTURHUFVfVk1fTVRZUEVfVUMJCSg0IDw8IDUpDQo+ICsv
KiBVc2UgUlcgTVRZUEUgaW5zdGVhZCBvZiBkZWZhdWx0IE1UWVBFICovDQo+ICsjZGVmaW5lIEFN
REdQVV9WTV9NVFlQRV9SVwkJKDUgPDwgNSkNCj4gICANCj4gICBzdHJ1Y3QgZHJtX2FtZGdwdV9n
ZW1fdmEgew0KPiAgIAkvKiogR0VNIG9iamVjdCBoYW5kbGUgKi8NCg0KX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1k
LWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
