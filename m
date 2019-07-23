Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CA47971C9E
	for <lists+amd-gfx@lfdr.de>; Tue, 23 Jul 2019 18:15:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66FD589A98;
	Tue, 23 Jul 2019 16:15:00 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr720052.outbound.protection.outlook.com [40.107.72.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4502889A98
 for <amd-gfx@lists.freedesktop.org>; Tue, 23 Jul 2019 16:14:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QsnC+41qvkRDoJfsIQMwYSyDoh2pb6D528xNmTWS3G/epm5Lk4VSn3TPq96iSiFIv9W2eDeCgq7x3qZZnnfubYEMlmtU7r3w8fU4xANhdJhlFW5/xnX7RMdR/gF5Wp6ZuOfhryY0QzFZ6xUAI7QOm51Nnz1OsRy31b/Rpf/riMnXsNNAnayGwUqs/WGVAIC7q8GBCfxotk2eXqV1xhK36SxYrcZ+kSxRH0WRTfPFQxuTf/yROz1GjyG+3Wm5o9570RUr+ERyc6ec/iqTEpvbjPDsUyeRiFVidqzJr9TbvGcqkF50cS2Q3/msbGXThK4EAtmmoL6FUSw41nw1TVq3Ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tgEqqtNIYq4AlX4VuxlZl65cRwBc/lS8M/SayEH1Ba0=;
 b=hNZnzb6tSX3bqg1saH3aGlnVnIR53Fte7zKdb+OyqkqjLjue6gkUCvngy03FGIPtou2UiDhJDmzrFrYlX4wXhNHbIhm8fRq9SoY83Gze5pxD5CmHo92g0ms0x+V4xFuRPleuafR3+HdDNK7HUBDzuycYVwYGLezbiIuctgTiE5kVUstHdiOmkuJl8F5MtKASabf8fpookZOy1H1vgmJ8G78xgSpSwLtW8JvwF40fhk4TvRgeNhyOnNpFTWKWFpCL4fJkBWSM17tpQaA+F3Gte4Ymc1N7785EDO2Pm49UUGvF2vGcQf5Nu1RiDk0pKiVfxMEqCgsMWxc3MoMXVZ6Kyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from DM5PR12MB1546.namprd12.prod.outlook.com (10.172.36.23) by
 DM5PR12MB1658.namprd12.prod.outlook.com (10.172.34.136) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.16; Tue, 23 Jul 2019 16:14:57 +0000
Received: from DM5PR12MB1546.namprd12.prod.outlook.com
 ([fe80::cda7:cfc1:ce62:bcb7]) by DM5PR12MB1546.namprd12.prod.outlook.com
 ([fe80::cda7:cfc1:ce62:bcb7%10]) with mapi id 15.20.2094.013; Tue, 23 Jul
 2019 16:14:57 +0000
From: "Koenig, Christian" <Christian.Koenig@amd.com>
To: "Grodzovsky, Andrey" <Andrey.Grodzovsky@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 0/3] Enable Scatter Gather for Picasso.
Thread-Topic: [PATCH 0/3] Enable Scatter Gather for Picasso.
Thread-Index: AQHVQXBX7p2UN291TUSKZL/qiEoe+qbYYKEA
Date: Tue, 23 Jul 2019 16:14:57 +0000
Message-ID: <005b0f93-d3a4-99eb-ff42-615512ceada4@amd.com>
References: <1563897851-11501-1-git-send-email-andrey.grodzovsky@amd.com>
In-Reply-To: <1563897851-11501-1-git-send-email-andrey.grodzovsky@amd.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-originating-ip: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
x-clientproxiedby: AM6P191CA0080.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:209:8a::21) To DM5PR12MB1546.namprd12.prod.outlook.com
 (2603:10b6:4:8::23)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: deb510e8-770c-4222-eb11-08d70f88e7c9
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM5PR12MB1658; 
x-ms-traffictypediagnostic: DM5PR12MB1658:
x-microsoft-antispam-prvs: <DM5PR12MB165889B59FCF672175CA60E283C70@DM5PR12MB1658.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4502;
x-forefront-prvs: 0107098B6C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(39860400002)(346002)(366004)(136003)(376002)(199004)(189003)(186003)(478600001)(8936002)(6246003)(65956001)(65806001)(31696002)(53936002)(4326008)(81156014)(81166006)(86362001)(99286004)(8676002)(6512007)(102836004)(446003)(486006)(66556008)(66946007)(64756008)(66446008)(65826007)(66476007)(14454004)(71200400001)(71190400001)(11346002)(36756003)(64126003)(58126008)(256004)(54906003)(386003)(6436002)(110136005)(2616005)(316002)(2501003)(476003)(31686004)(25786009)(305945005)(6486002)(7736002)(5660300002)(46003)(76176011)(229853002)(68736007)(6506007)(52116002)(2906002)(4744005)(6116002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1658;
 H:DM5PR12MB1546.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: j9Rgc18rdj7OnWH+H1sTC31CLekl2Nxwiox7m3E3tw+Xo95o2Wn8sdt0tV5DZKMwM7K36sbN8YzNwEK4ImHIt7k34CGMhvfwDQCzoLMlvalox5KvtBdU8X0K9xHLjSBYTb//OiRUJjm962tIf4SGglOIqETl6BxIc6UcrLzehijLhUC+Nhvnfn9qYXUrTyPF+ybc3c3ScuxfgiadH3QIhiMFDtTrmhDB/NWCg1lRdV7wBpT6wHAIDKiiEqiO0D0LIvTCd2O9FP9dzrhd70iB61xObfnW8CeTdGSfDfgLVJujC5swurJbv/OEuii7yZUlzwPwuzrdb/julueh6yuJHdThTIvvkejyMuY6Axxj2dzFjoZaWfndXUpY42dup0G7yS9XaJl5Bcy8iKt95M6pti0kwpLpLXkbnUQkjHZ9lCY=
Content-ID: <ABA99BFF14F94D458DDCD0801DE014B0@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: deb510e8-770c-4222-eb11-08d70f88e7c9
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jul 2019 16:14:57.7125 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ckoenig@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1658
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tgEqqtNIYq4AlX4VuxlZl65cRwBc/lS8M/SayEH1Ba0=;
 b=fUAsd6JjzBpCzQ2fZf5oT0AIHK2ZEKkFrLyRWs5OKfR6rTpIMOMHagTHsAtqIkqEw7RAEt/ZMgQo0nbqvJOtJpnPaqimvkd5Am44fJjZPOWjJyiUdPVqzCGrZxdJyu1vgre+Y7L5xhQzwjmxPwYK1CoTAkbKLf/17/Z1AKpR0ww=
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Wu,
 Hersen" <hersenxs.wu@amd.com>, "S, Shirish" <Shirish.S@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

U2VyaWVzIGlzIFJldmlld2VkLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmln
QGFtZC5jb20+DQoNCkFtIDIzLjA3LjE5IHVtIDE4OjA0IHNjaHJpZWIgQW5kcmV5IEdyb2R6b3Zz
a3k6DQo+IFRoaXMgc2VyaWVzIGVuYWJsZXMgUy9HIGZvciBQaWNhc3NvLg0KPiBGaXJzdCAyIHBh
dGNoZXMgZml4IGEgaGFyZCBoYW5nIGludHJvZHVjZWQgYnkgcGxhY2luZyB0aGUgZGlzcGxheQ0K
PiBCTyBpbiBHVFQgbWVtb3J5IGJlY2F1c2Ugb2YgSFcgaXNzdWVzIHdpdGggY2FjaGVkIG1hcHBp
bmdzDQo+IGFuZCB0aGUgdGhpcmQgcGF0Y2ggZW5hYmxlcyBTL0cuDQo+DQo+IEFuZHJleSBHcm9k
em92c2t5ICgyKToNCj4gICAgZHJtL2FtZGdwdTogRml4IGhhcmQgaGFuZyBmb3IgUy9HIGRpc3Bs
YXkgQk9zLg0KPiAgICBkcm0vYW1kL2Rpc3BsYXk6IE9ubHkgYWxsb3cgcy9nIHdoZW4gVVNXQyBm
bGFnIGlzIHNldC4NCj4NCj4gU2hpcmlzaCBTICgxKToNCj4gICAgZHJtL2FtZDogZW5hYmxlIFMv
RyBmb3IgUkFWRU4gY2hpcA0KPg0KPiAgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdw
dV9kaXNwbGF5LmMgICAgICAgfCAgMiArLQ0KPiAgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L2FtZGdwdV9mYi5jICAgICAgICAgICAgfCAxNCArKysrKysrKysrKy0tLQ0KPiAgIGRyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9nZW0uYyAgICAgICAgICAgfCAgNCArKystDQo+ICAg
ZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uYyB8ICA0ICsr
LS0NCj4gICA0IGZpbGVzIGNoYW5nZWQsIDE3IGluc2VydGlvbnMoKyksIDcgZGVsZXRpb25zKC0p
DQo+DQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFt
ZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
