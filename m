Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 533EC1499F
	for <lists+amd-gfx@lfdr.de>; Mon,  6 May 2019 14:34:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E611A898CA;
	Mon,  6 May 2019 12:34:33 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr690051.outbound.protection.outlook.com [40.107.69.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D09A4898CA
 for <amd-gfx@lists.freedesktop.org>; Mon,  6 May 2019 12:34:32 +0000 (UTC)
Received: from DM5PR12MB1546.namprd12.prod.outlook.com (10.172.36.23) by
 DM5PR12MB1914.namprd12.prod.outlook.com (10.175.86.136) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1856.11; Mon, 6 May 2019 12:34:30 +0000
Received: from DM5PR12MB1546.namprd12.prod.outlook.com
 ([fe80::70fc:f26c:1e22:73ba]) by DM5PR12MB1546.namprd12.prod.outlook.com
 ([fe80::70fc:f26c:1e22:73ba%10]) with mapi id 15.20.1856.012; Mon, 6 May 2019
 12:34:30 +0000
From: "Koenig, Christian" <Christian.Koenig@amd.com>
To: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Subject: Re: How to dump gfx and waves after GPU reset happened?
Thread-Topic: How to dump gfx and waves after GPU reset happened?
Thread-Index: AQHVAmdTHKJ26YjsCE+QGkXkKxow3qZcUxKAgAG0YYCAAAPRAA==
Date: Mon, 6 May 2019 12:34:30 +0000
Message-ID: <6cc00e3e-1915-4257-305a-00d8c9e3383d@amd.com>
References: <CABXGCsMY=LvtCp0V8U8jbARXgapjQe4WP9ss-ui3fHsPQjevXg@mail.gmail.com>
 <98231ce0-f29c-df52-1ba3-c9f85a76bcac@gmail.com>
 <CABXGCsOXEWS5fUrQZQf0qdH6Wn=h5BC9cPaoQk8hYhvW-nm6AA@mail.gmail.com>
 <58827d68-cc9a-4a37-f078-7aec9b6a98cd@gmail.com>
 <CABXGCsPcfyvHqhhGYAgnA-FoQ5zRovu7NP7GMiGBvrqwoe5ahA@mail.gmail.com>
In-Reply-To: <CABXGCsPcfyvHqhhGYAgnA-FoQ5zRovu7NP7GMiGBvrqwoe5ahA@mail.gmail.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
x-originating-ip: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
x-clientproxiedby: AM0PR07CA0021.eurprd07.prod.outlook.com
 (2603:10a6:208:ac::34) To DM5PR12MB1546.namprd12.prod.outlook.com
 (2603:10b6:4:8::23)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a1015f9a-6316-4ae9-ec37-08d6d21f2f81
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:DM5PR12MB1914; 
x-ms-traffictypediagnostic: DM5PR12MB1914:
x-microsoft-antispam-prvs: <DM5PR12MB19147AF29FB6B7C1FD9CCE1883300@DM5PR12MB1914.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0029F17A3F
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(366004)(39860400002)(376002)(136003)(396003)(346002)(199004)(189003)(186003)(2616005)(446003)(476003)(6486002)(6436002)(6246003)(6512007)(486006)(54906003)(305945005)(46003)(7736002)(81156014)(81166006)(65826007)(72206003)(229853002)(64126003)(8676002)(58126008)(256004)(478600001)(8936002)(53936002)(99286004)(316002)(36756003)(2906002)(6506007)(386003)(25786009)(11346002)(6116002)(5660300002)(4326008)(31686004)(65956001)(65806001)(6916009)(66446008)(76176011)(68736007)(66556008)(66476007)(73956011)(66946007)(64756008)(86362001)(52116002)(71190400001)(71200400001)(31696002)(14454004)(102836004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1914;
 H:DM5PR12MB1546.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: uvVibyLt+YpNSKcXb2l2vzjuJVfF7eFcPt0VM7TxWgHXn6Bmgppw6oA0tRN7MHckvrygQW5kRKkNluDHHndSPizhcJL3NG7ARXnh5NYLIdTfiJhSoD3/tMZ5pUU4ibgaJBi5/It7LS/oXvfyr+cDRW43ek1D5A+vX7V1ZI7fmftq24kXNe15AtneDbef/1SUbl3LMoJYfD03hjOQb6YXlBaTOK6MJE8r3GaqGiXhgSUDsSXKuJaNkSUStulf0Sq9hWuV0xwoXvu9EzEgrtzS1XVV6fFCB6phgmGgWNOld5bwnqlznUcmIoGmMLxx171sNCAc/G1ljis50KDXqKpSa8W3hfMEEZK6mxXVEQzl7GOr9ilRmLjuD03NWTudXkpeQmnUmFtKyLSVSNV/8c9qBtxI+RKGf5iNbJiV+gzLFCQ=
Content-ID: <A48C1423FF33004E98A8EFF83DB795C3@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a1015f9a-6316-4ae9-ec37-08d6d21f2f81
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 May 2019 12:34:30.6069 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1914
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amd-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=brEvc9RwKGGMDD/jNWXvuR++CVaOn+J8cFfyUJb/9mY=;
 b=IW1MLcMj1ONiWT+pCw2YoS2g1ZU3RVpbfvM0If8QFoRDle68DZ7+2LL5fLmONk1njI8D72rroz5FRKGezZ7pIfDSU8lvvpCw+yzzT61xatRxap50gIV5Rp2W3WwkDmpgO694t+ZHmh9DaU15wE4P3onrmCXHcgm1HejjQvqDdws=
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
Cc: "StDenis, Tom" <Tom.StDenis@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

QW0gMDYuMDUuMTkgdW0gMTQ6MjAgc2NocmllYiBNaWtoYWlsIEdhdnJpbG92Og0KPiBbQ0FVVElP
TjogRXh0ZXJuYWwgRW1haWxdDQo+DQo+IE9uIFN1biwgNSBNYXkgMjAxOSBhdCAxNToxOCwgQ2hy
aXN0aWFuIEvDtm5pZw0KPiA8Y2tvZW5pZy5sZWljaHR6dW1lcmtlbkBnbWFpbC5jb20+IHdyb3Rl
Og0KPj4gWWVhaCwgYnV0IGZvciBtb3N0IGVuZCB1c2VycyB3ZSBuZWVkIHRvIGdldCB0aGUgR1BV
IHdvcmtpbmcgYXMgZmFzdCBhcw0KPj4gcG9zc2libGUgb24gYSBsb2NrdXAuDQo+Pg0KPj4gU2F2
aW5nIGFsbCB0aGUgc3RhdGUgKHdoaWNoIGFjdHVhbGx5IGNhbiBiZSBhIGNvdXBsZSBvZiBnaWdh
Ynl0ZXMgaWYgeW91DQo+PiBpbmNsdWRlIGFsbCB0ZXh0dXJlcyBldGMuLikgaXMgbm90IHJlYWxs
eSBhbiBvcHRpb24gdGhlbi4NCj4+DQo+PiBXaGF0IHdlIGNvdWxkIHByb2JhYmx5IGRvIHJhdGhl
ciBlYXNpbHkgaXMgdG8gYWRkIGEgZnVuY3Rpb24gdG8gcnVuIGENCj4+IHNjcmlwdCBpbnN0ZWFk
IG9mIGEgR1BVIHJlc2V0IG9uIGxvY2t1cCBkZXRlY3Rpb24uDQo+Pg0KPiBUaGlzIHdvdWxkIGJl
IHVzZWZ1bCBpZiB0aGlzIHNjcmlwdCB3b3VsZCBydW4gbm90IGluc3RlYWQgR1BVIHJlc2V0DQo+
IGFuZCBiZWZvcmUgR1BVIHJlc2V0Lg0KDQpUaGF0IHdvbid0IHdvcmsuIFRoZSBrZXJuZWwgY2Fu
J3Qgd2FpdCBmb3Igc3Bhd25lZCBwcm9jZXNzZXMgdG8gZmluaXNoIA0KYmVjYXVzZSBpdCBpcyBo
b2xkaW5nIGxvY2tzLg0KDQpUaGUgc2NyaXB0IGNvdWxkIGFzIGxhc3Qgb3BlcmF0aW9uIHRyaWdn
ZXIgYSBtYW51YWwgcmVzZXQsIGJ1dCB0aGF0IA0Kd291bGQgbm90IGJlIHRoZSBzYW1lIGFzIGEg
dGltZW91dCByZXNldCBiZWNhdXNlIHlvdSBkb24ndCBrbm93IHRoZSANCmNhdXNlIG9mIGl0IGFu
ZCB3b3VsZCBhbHdheXMgbmVlZCB0byBkbyBhIGZ1bGwgZW5naW5lIHJlc2V0Lg0KDQpTb3JyeSwg
YnV0IHdoYXQgeW91IGFyZSBzdWdnZXN0aW5nIGhlcmUgKGNvbGxlY3QgZGF0YSBhbmQgdGhlbiBy
ZXNldCkgaXMgDQpub3QgZWFzaWx5IGRvYWJsZS4NCg0KQ2hyaXN0aWFuLg0KDQo+DQo+IC0tDQo+
IEJlc3QgUmVnYXJkcywNCj4gTWlrZSBHYXZyaWxvdi4NCg0KX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9hbWQtZ2Z4
