Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E8BA32968
	for <lists+amd-gfx@lfdr.de>; Mon,  3 Jun 2019 09:26:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9697C89254;
	Mon,  3 Jun 2019 07:26:21 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr780074.outbound.protection.outlook.com [40.107.78.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B9FA89254
 for <amd-gfx@lists.freedesktop.org>; Mon,  3 Jun 2019 07:26:20 +0000 (UTC)
Received: from MN2PR12MB3312.namprd12.prod.outlook.com (20.179.83.160) by
 MN2PR12MB3136.namprd12.prod.outlook.com (20.178.244.89) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1943.18; Mon, 3 Jun 2019 07:26:18 +0000
Received: from MN2PR12MB3312.namprd12.prod.outlook.com
 ([fe80::b828:da4:7aaf:485f]) by MN2PR12MB3312.namprd12.prod.outlook.com
 ([fe80::b828:da4:7aaf:485f%3]) with mapi id 15.20.1943.018; Mon, 3 Jun 2019
 07:26:18 +0000
From: "Cui, Flora" <fcui@amd.com>
To: "Cui, Flora" <Flora.Cui@amd.com>, "Daenzer, Michel"
 <Michel.Daenzer@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v2] dri2: reply to client for WaitMSC request in any case
Thread-Topic: [PATCH v2] dri2: reply to client for WaitMSC request in any case
Thread-Index: AQHVGd2iVZomUiDEbUapsCAJJL6lcQ==
Date: Mon, 3 Jun 2019 07:26:18 +0000
Message-ID: <bc4571fc-6521-74d7-2d5c-1665396b50fc@amd.com>
References: <1559111780-32513-1-git-send-email-flora.cui@amd.com>
In-Reply-To: <1559111780-32513-1-git-send-email-flora.cui@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
x-originating-ip: [180.167.199.189]
x-clientproxiedby: HK0PR03CA0020.apcprd03.prod.outlook.com
 (2603:1096:203:2e::32) To MN2PR12MB3312.namprd12.prod.outlook.com
 (2603:10b6:208:106::32)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c44bb760-eeb2-4aa2-c0d1-08d6e7f4c525
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:MN2PR12MB3136; 
x-ms-traffictypediagnostic: MN2PR12MB3136:
x-microsoft-antispam-prvs: <MN2PR12MB3136CDE905498B28A22FA8C2FA140@MN2PR12MB3136.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2803;
x-forefront-prvs: 0057EE387C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(136003)(396003)(346002)(39860400002)(376002)(366004)(199004)(189003)(65826007)(65806001)(36756003)(8676002)(7736002)(486006)(446003)(3846002)(5660300002)(186003)(68736007)(6116002)(81156014)(81166006)(2616005)(6436002)(66066001)(316002)(8936002)(65956001)(110136005)(11346002)(99286004)(2501003)(58126008)(476003)(52116002)(72206003)(305945005)(386003)(53936002)(6486002)(6506007)(76176011)(256004)(6512007)(64756008)(66446008)(71190400001)(26005)(14444005)(14454004)(66476007)(71200400001)(25786009)(64126003)(2906002)(31696002)(66556008)(66946007)(31686004)(102836004)(478600001)(73956011);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3136;
 H:MN2PR12MB3312.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 8s/pcirhBPJ/s/YNs//nz2ixRnun1E0tSfdDNGpCS8lBzJpFmYY2tWB8FLYRUUBwtX0ZFPcO4izv7nmMUgYr1B8H4RSTOBZqD6t3UOtXBA+R9cIkEYAmQqxaJP4vWedfdNjDQDGlsYoDPwS2ie9y/+RJcpznGQygf6Gw29UCgH5hBi71wgLQ6j1PFqVGrjrWB18VWv2c92ETqYneGkuVP1GtiY+KCUMzFdP8ZdXuLIacE1zpkz34d+08oLbRrhDlE9J3WeA75QBLKZXa+cU68R3FMH9ttzdLNaQo9B6/WtmX5Ral/B4Vlwyj1pq7bAdW+pom5817Nec5htLtKdUT3Vg7EMvvwbdwYQGPH5iVcSS6s8fjW1v2UGRO840NUrk6+GGFYgv1D5LZS1ygJEksnrbmurLLtDMpxhjmSj2JmjM=
Content-ID: <245229AD34C1BB4D8926C2F7D0D3FC86@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c44bb760-eeb2-4aa2-c0d1-08d6e7f4c525
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jun 2019 07:26:18.8064 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fcui@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3136
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dYhzm5jc+e05VPuno5zrpgdP91ezd/0uakvCBEhrRNQ=;
 b=PuZc685s+VuiyZpMhlQHBAHxQQJw719sYhg5+79IWBHi2btaKsShgCYeKrDT3dwAqye9JLKFOtJemTvQAUJi3Vv//Z+uqIbX5GNOBmPHUgUq8rEhgTgDZ30Qgl2xZAsFXGUzZ3RIs1jDhH7HsxXQXLuemgdJgmI+KpymRFXEkWc=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Flora.Cui@amd.com; 
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

cGluZy4uLg0KDQpjb21taXQgNDc2MTNlOGU4ZjRhNWUzYjI1ODMwZTNjMDE1YTRhMjE3ZmNiZTQ2
OQ0KQXV0aG9yOiBGbG9yYSBDdWkgPGZsb3JhLmN1aUBhbWQuY29tPg0KRGF0ZTrCoMKgIFdlZCBN
YXkgMjkgMTQ6MTg6NTAgMjAxOSArMDgwMA0KDQogwqDCoMKgIGRyaTI6IHJlcGx5IHRvIGNsaWVu
dCBmb3IgV2FpdE1TQyByZXF1ZXN0IGluIGFueSBjYXNlDQoNCiDCoMKgwqAgb3RoZXJ3aXNlIGNs
aWVudCB3b3VsZCB3YWl0IGZvciByZXBseSBmb3JldmVyIGFuZCBkZXNrdG9wIGFwcGVhcnMgaGFu
Zy4NCg0KIMKgwqDCoCBTaWduZWQtb2ZmLWJ5OiBGbG9yYSBDdWkgPGZsb3JhLmN1aUBhbWQuY29t
Pg0KDQpkaWZmIC0tZ2l0IGEvc3JjL2FtZGdwdV9kcmkyLmMgYi9zcmMvYW1kZ3B1X2RyaTIuYw0K
aW5kZXggNDQzMTZhYy4uYmIzZDlkMCAxMDA2NDQNCi0tLSBhL3NyYy9hbWRncHVfZHJpMi5jDQor
KysgYi9zcmMvYW1kZ3B1X2RyaTIuYw0KQEAgLTEwNjIsNiArMTA2Miw5IEBAIHN0YXRpYyBpbnQg
YW1kZ3B1X2RyaTJfc2NoZWR1bGVfd2FpdF9tc2MoQ2xpZW50UHRyIA0KY2xpZW50LCBEcmF3YWJs
ZVB0ciBkcmF3LA0KIMKgb3V0X2NvbXBsZXRlOg0KIMKgwqDCoMKgwqDCoMKgIGlmICh3YWl0X2lu
Zm8pDQogwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGFtZGdwdV9kcmkyX2RlZmVycmVk
X2V2ZW50KE5VTEwsIDAsIHdhaXRfaW5mbyk7DQorwqDCoMKgwqDCoMKgIGVsc2UNCivCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIERSSTJXYWl0TVNDQ29tcGxldGUoY2xpZW50LCBkcmF3LCB0
YXJnZXRfbXNjLCAwLCAwKTsNCisNCiDCoMKgwqDCoMKgwqDCoCByZXR1cm4gVFJVRTsNCiDCoH0N
Cg0K5ZyoIDUvMjkvMjAxOSAyOjM2IFBNLCBDdWksIEZsb3JhIOWGmemBkzoNCj4gb3RoZXJ3aXNl
IGNsaWVudCB3b3VsZCB3YWl0IGZvciByZXBseSBmb3JldmVyIGFuZCBkZXNrdG9wIGFwcGVhcnMg
aGFuZy4NCj4NCj4gU2lnbmVkLW9mZi1ieTogRmxvcmEgQ3VpIDxmbG9yYS5jdWlAYW1kLmNvbT4N
Cj4gLS0tDQo+ICAgc3JjL2FtZGdwdV9kcmkyLmMgfCAzICsrKw0KPiAgIDEgZmlsZSBjaGFuZ2Vk
LCAzIGluc2VydGlvbnMoKykNCj4NCj4gZGlmZiAtLWdpdCBhL3NyYy9hbWRncHVfZHJpMi5jIGIv
c3JjL2FtZGdwdV9kcmkyLmMNCj4gaW5kZXggNDQzMTZhYy4uMzQzNTNhNyAxMDA2NDQNCj4gLS0t
IGEvc3JjL2FtZGdwdV9kcmkyLmMNCj4gKysrIGIvc3JjL2FtZGdwdV9kcmkyLmMNCj4gQEAgLTEw
NjIsNiArMTA2Miw5IEBAIHN0YXRpYyBpbnQgYW1kZ3B1X2RyaTJfc2NoZWR1bGVfd2FpdF9tc2Mo
Q2xpZW50UHRyIGNsaWVudCwgRHJhd2FibGVQdHIgZHJhdywNCj4gICBvdXRfY29tcGxldGU6DQo+
ICAgCWlmICh3YWl0X2luZm8pDQo+ICAgCQlhbWRncHVfZHJpMl9kZWZlcnJlZF9ldmVudChOVUxM
LCAwLCB3YWl0X2luZm8pOw0KPiArDQo+ICsJRFJJMldhaXRNU0NDb21wbGV0ZShjbGllbnQsIGRy
YXcsIHRhcmdldF9tc2MsIDAsIDApOw0KPiArDQo+ICAgCXJldHVybiBUUlVFOw0KPiAgIH0NCj4g
ICANCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1n
ZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
