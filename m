Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A91E2BD7C
	for <lists+amd-gfx@lfdr.de>; Tue, 28 May 2019 05:07:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 371A089ABA;
	Tue, 28 May 2019 03:07:55 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-BY2-obe.outbound.protection.outlook.com
 (mail-by2nam05on061b.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe52::61b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F0F489AB9
 for <amd-gfx@lists.freedesktop.org>; Tue, 28 May 2019 03:07:53 +0000 (UTC)
Received: from MN2PR12MB3312.namprd12.prod.outlook.com (20.179.83.160) by
 MN2PR12MB3166.namprd12.prod.outlook.com (20.179.81.208) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1922.15; Tue, 28 May 2019 03:05:53 +0000
Received: from MN2PR12MB3312.namprd12.prod.outlook.com
 ([fe80::b828:da4:7aaf:485f]) by MN2PR12MB3312.namprd12.prod.outlook.com
 ([fe80::b828:da4:7aaf:485f%3]) with mapi id 15.20.1922.021; Tue, 28 May 2019
 03:05:53 +0000
From: "Cui, Flora" <fcui@amd.com>
To: "Zhou, David(ChunMing)" <David1.Zhou@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Cui, Flora"
 <Flora.Cui@amd.com>
Subject: Re: [PATCH] drm/amdgpu: add DRIVER_SYNCOBJ_TIMELINE to amdgpu
Thread-Topic: [PATCH] drm/amdgpu: add DRIVER_SYNCOBJ_TIMELINE to amdgpu
Thread-Index: AQHVFQBZ/6nN0+tOvU+K25sfa18pZqZ/2nwA
Date: Tue, 28 May 2019 03:05:53 +0000
Message-ID: <3e5a2a4c-f4b5-d600-30a4-ce6e50e2cd72@amd.com>
References: <20190528025203.11593-1-david1.zhou@amd.com>
In-Reply-To: <20190528025203.11593-1-david1.zhou@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
x-originating-ip: [180.167.199.189]
x-clientproxiedby: HK2PR04CA0073.apcprd04.prod.outlook.com
 (2603:1096:202:15::17) To MN2PR12MB3312.namprd12.prod.outlook.com
 (2603:10b6:208:106::32)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c01d6cad-c248-40e0-30ac-08d6e319652b
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3166; 
x-ms-traffictypediagnostic: MN2PR12MB3166:
x-microsoft-antispam-prvs: <MN2PR12MB31669EC8FEE5296FA2D87D83FA1E0@MN2PR12MB3166.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:873;
x-forefront-prvs: 00514A2FE6
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(376002)(396003)(346002)(39860400002)(366004)(136003)(189003)(199004)(64756008)(66556008)(66446008)(66946007)(66476007)(186003)(73956011)(305945005)(68736007)(31686004)(26005)(7736002)(52116002)(4744005)(6506007)(81166006)(8936002)(81156014)(8676002)(486006)(76176011)(58126008)(2501003)(99286004)(6246003)(36756003)(6636002)(102836004)(53936002)(110136005)(6512007)(65826007)(6486002)(72206003)(476003)(2616005)(256004)(478600001)(5660300002)(6436002)(229853002)(446003)(64126003)(2906002)(25786009)(71200400001)(71190400001)(386003)(14444005)(66066001)(316002)(65956001)(65806001)(6116002)(3846002)(14454004)(31696002)(11346002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3166;
 H:MN2PR12MB3312.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: vo6xKxsspe2flOSpfECP+46qvuEaEmQr1JufAoh3CLUdaGuX1UTg9Dk1kUfYanrbMt4swDORu79sdqNs9Yjw7IxlD6r0M12Ayrkknu97icoh0sKmBb+Ly1vP/nkl1gdsjYm+uz47O3Oz4KzEgvdkmgj6GxO40CUglfZQe+cIyAqbzy6KGOeyxcWg99JQgyPG2ytYQioe9SMqAdfe7YaOkFqlJReBtC3tWY2IjuDOJfT9Xn2D9+LXd4LIzl3AbOeCExv4ZaJrkGS1DPWejO3H6cpDv30mlYkrHDt3vKykNjNRg56PjGni7edJoTdRTjFaUNwJKbrPz/Sl8ZnkZXKqunmkapEg+Djq3iHVEqbI56UTjP3Rp+AvRK51PIxHInxYwxH0bVYtQdg7kShv1XMpX2W1qOgNKsOzHUf5r6b8C0Q=
Content-ID: <E376AEF075889643B60A30F6B44402F0@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c01d6cad-c248-40e0-30ac-08d6e319652b
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 May 2019 03:05:53.6377 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fcui@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3166
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0FDbIipWNX6GQwNgeJ3ElklSBRm2JXouKP2BxklLQD0=;
 b=ZfN+k3iaUSiNYLkqNrE66JVwKWY8QYAop/4ZGUwfd4HpM3YlztHFiZ954B05hZLqWd2nDWffVFOgWuUU4zIjOec7bWC9k9qmkHXDvHWETkEHIVwJyBe8wAg/967dgReEeIr3io+9wZKD6DSbTZB25W9fCh0nhOl6O4Yf6gFqS8s=
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

dGhlIHBhdGNoIGlzIFJldmlld2VkLWJ5OiBGbG9yYSBDdWkgPEZsb3JhLkN1aUBhbWQuY29tPg0K
DQrlnKggNS8yOC8yMDE5IDEwOjUyIEFNLCBDaHVubWluZyBaaG91IOWGmemBkzoNCj4gQ2hhbmdl
LUlkOiBJMmIxYWYxNDc4ZmJkZGJiNTA4NGI5MGIzZmY4NWMyZWI5NjRiZDIxNw0KPiBTaWduZWQt
b2ZmLWJ5OiBDaHVubWluZyBaaG91IDxkYXZpZDEuemhvdUBhbWQuY29tPg0KPiAtLS0NCj4gICBk
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZHJ2LmMgfCAzICsrLQ0KPiAgIDEgZmls
ZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCj4NCj4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kcnYuYyBiL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kcnYuYw0KPiBpbmRleCA3ODcwNmRmYTc1M2EuLjFmMzhk
NmZjMWZlMyAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1
X2Rydi5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kcnYuYw0K
PiBAQCAtMTMwNyw3ICsxMzA3LDggQEAgc3RhdGljIHN0cnVjdCBkcm1fZHJpdmVyIGttc19kcml2
ZXIgPSB7DQo+ICAgCS5kcml2ZXJfZmVhdHVyZXMgPQ0KPiAgIAkgICAgRFJJVkVSX1VTRV9BR1Ag
fCBEUklWRVJfQVRPTUlDIHwNCj4gICAJICAgIERSSVZFUl9HRU0gfA0KPiAtCSAgICBEUklWRVJf
UFJJTUUgfCBEUklWRVJfUkVOREVSIHwgRFJJVkVSX01PREVTRVQgfCBEUklWRVJfU1lOQ09CSiwN
Cj4gKwkgICAgRFJJVkVSX1BSSU1FIHwgRFJJVkVSX1JFTkRFUiB8IERSSVZFUl9NT0RFU0VUIHwg
RFJJVkVSX1NZTkNPQkogfA0KPiArCSAgICBEUklWRVJfU1lOQ09CSl9USU1FTElORSwNCj4gICAJ
LmxvYWQgPSBhbWRncHVfZHJpdmVyX2xvYWRfa21zLA0KPiAgIAkub3BlbiA9IGFtZGdwdV9kcml2
ZXJfb3Blbl9rbXMsDQo+ICAgCS5wb3N0Y2xvc2UgPSBhbWRncHVfZHJpdmVyX3Bvc3RjbG9zZV9r
bXMsDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQt
Z2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
