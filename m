Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30A7650C5B
	for <lists+amd-gfx@lfdr.de>; Mon, 24 Jun 2019 15:50:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A718089B38;
	Mon, 24 Jun 2019 13:50:12 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr690040.outbound.protection.outlook.com [40.107.69.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 747F889B38
 for <amd-gfx@lists.freedesktop.org>; Mon, 24 Jun 2019 13:50:11 +0000 (UTC)
Received: from DM5PR12MB1418.namprd12.prod.outlook.com (10.168.240.15) by
 DM5PR12MB1850.namprd12.prod.outlook.com (10.175.86.23) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2008.16; Mon, 24 Jun 2019 13:50:09 +0000
Received: from DM5PR12MB1418.namprd12.prod.outlook.com
 ([fe80::4975:2f30:93db:bcaa]) by DM5PR12MB1418.namprd12.prod.outlook.com
 ([fe80::4975:2f30:93db:bcaa%9]) with mapi id 15.20.2008.014; Mon, 24 Jun 2019
 13:50:09 +0000
From: "Zhang, Hawking" <Hawking.Zhang@amd.com>
To: =?utf-8?B?RGlldGVyIE7DvHR6ZWw=?= <Dieter@nuetzel-hh.de>, Alex Deucher
 <alexdeucher@gmail.com>
Subject: RE: [amd-staging-drm-next] broken after Navi merge
Thread-Topic: [amd-staging-drm-next] broken after Navi merge
Thread-Index: AQHVKpDN9tJBq/25KEO5iZRD1Vrrsqaq0bMw
Date: Mon, 24 Jun 2019 13:50:09 +0000
Message-ID: <DM5PR12MB1418BDB2340B377498F22901FCE00@DM5PR12MB1418.namprd12.prod.outlook.com>
References: <9ec82cfce8a6ee8f24e085e1a423ecaf@nuetzel-hh.de>
In-Reply-To: <9ec82cfce8a6ee8f24e085e1a423ecaf@nuetzel-hh.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 960bc4a9-a348-47ba-d4c6-08d6f8aadf93
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM5PR12MB1850; 
x-ms-traffictypediagnostic: DM5PR12MB1850:
x-ms-exchange-purlcount: 2
x-microsoft-antispam-prvs: <DM5PR12MB18500C6BACFCE2248D3152A4FCE00@DM5PR12MB1850.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2958;
x-forefront-prvs: 007814487B
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(366004)(136003)(346002)(396003)(39860400002)(376002)(13464003)(199004)(189003)(53936002)(33656002)(486006)(66946007)(66476007)(66556008)(76116006)(73956011)(102836004)(71190400001)(71200400001)(110136005)(8936002)(316002)(186003)(55016002)(6436002)(229853002)(7736002)(76176011)(7696005)(53546011)(68736007)(6506007)(74316002)(6306002)(99286004)(9686003)(305945005)(25786009)(476003)(11346002)(66066001)(66446008)(4326008)(26005)(14444005)(256004)(52536014)(446003)(8676002)(6116002)(3846002)(81166006)(64756008)(66574012)(81156014)(966005)(6246003)(478600001)(72206003)(14454004)(86362001)(5660300002)(2906002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1850;
 H:DM5PR12MB1418.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: XzAoXrlzlpJTvF+oF8o+UpHT0vorXVL2QBDYnVo8xpYOW+qLVGVzyAWJSc9J/uckBMqPo1WQaIggQ0uBomN5SMHZx4OKm9gz1S1SqzAWNo6oe3yuUpKRfKZcXO8sbB2dOBdxELU80JDCZDhR604UhwWHHGEp+hik2ohCJmB5l9etYlPQfMUbmF5QyyAfVlefdEJtdaiWPCd9/s++GKjBGN7SpZ69MrYAywub/ND6tY/MqR78DDVD3xQhjhQiCAbYZMb5HzsRIvSb/pJi2a7vBEZxC8GYcJJiI2rG9WdJGaV6Ufa5goTZ8S7GbXkhVRUdTtgFQd52ActKURR0lkr55fNxQFRbDzpHDI4Mye+r6t+w4n4zAq0zxfWSbEzy0Cylq9b9/LFcrBAxe8YAVViOP4vDPWzfzWbplsoMcCvLgNA=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 960bc4a9-a348-47ba-d4c6-08d6f8aadf93
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jun 2019 13:50:09.7368 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hawzhang@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1850
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tXgXq7HdsqLBW1YxU0oeqvUt9Z7DIiqjcidAGzHOCpw=;
 b=0eUH80LyzSosb4cSUU8RjQsUWx6ZbQ1VvgMER5UsNr4qxI8FImo0aE3sY3tosrx0l5NqXG4dc1DK14aSrf826WW1JcTPX4ivMjtFsRcw9M67Pv3K+c35oJuBbe0DEWHmHyLFJ7UMxVv1dhiM5QvpXWNxv1kSG5gI6MFT42SISyY=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Hawking.Zhang@amd.com; 
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
Cc: amd-devel <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

UGxlYXNlIHB1bGwgbXkgbGF0ZXN0IGZpeGVzIHRoYXQgcHJvYmFibHkgaGVscHMgb24gaXNzdWUg
eW91IHJhbiBpbnRvLg0KNjFhZGRhMWY2ZjA4MDcxN2E5ZWU0Yzk2YTc0YzhkZjZmZmFiMWZmMCBk
cm0vYW1kZ3B1OiBmaXggbW9kcHJvYmUgZmFpbHVyZSBmb3IgdXZkXzQvNS82DQoNClJlZ2FyZHMs
DQpIYXdraW5nDQotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTogYW1kLWdmeCA8YW1k
LWdmeC1ib3VuY2VzQGxpc3RzLmZyZWVkZXNrdG9wLm9yZz4gT24gQmVoYWxmIE9mIERpZXRlciBO
w7x0emVsDQpTZW50OiAyMDE55bm0NuaciDI05pelIDIxOjI5DQpUbzogQWxleCBEZXVjaGVyIDxh
bGV4ZGV1Y2hlckBnbWFpbC5jb20+DQpDYzogYW1kLWRldmVsIDxhbWQtZ2Z4QGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZz4NClN1YmplY3Q6IFthbWQtc3RhZ2luZy1kcm0tbmV4dF0gYnJva2VuIGFmdGVy
IE5hdmkgbWVyZ2UNCg0KSGVsbG8gQWxleCwNCg0KYWZ0ZXIgeW91ciBsYXRlc3QgTmF2aSBtZXJn
ZSAnYW1kLXN0YWdpbmctZHJtLW5leHQnIGlzIGJyb2tlbiB3aXRoIFBvbGFyaXMgMjAuDQoNCkl0
IGhhbmdzIHdpdGggdmVyeSBsaWdodCBncmF5IChtb3N0bHkgYmxhY2spIHNjcmVlbiBhZnRlciBm
aXJzdCBtb2RlIHN3aXRjaC4NCg0KVGVzdGVkIGNvbW1pdDoNCjMxN2Q1MDMzYWI2YyAoSEVBRCAt
PiBhbWQtc3RhZ2luZy1kcm0tbmV4dCwgb3JpZ2luL2FtZC1zdGFnaW5nLWRybS1uZXh0KQ0KZHJt
L2FtZGdwdTogYWRkIGpvYi0+cHJlYW1ibGVfc3RhdHVzIGJhY2sgdG8gc3RhdHVzIHZhbHVlDQoN
CkV2ZW4gcnVuIG1vZGUgM3wxIHdpdGggZ3J1YjIgZG8gbm90IHdvcmtzLg0KDQpTZWUgYWxzbzoN
Cmh0dHBzOi8vd3d3LnBob3Jvbml4LmNvbS9mb3J1bXMvZm9ydW0vcGhvcm9uaXgvbGF0ZXN0LXBo
b3Jvbml4LWFydGljbGVzLzExMDg1MDAtYW1kLXNlbmRzLWluLW5hdmktc3VwcG9ydC1vdGhlci1y
ZW1haW5pbmctYW1kZ3B1LWNoYW5nZXMtZm9yLWxpbnV4LTUtMz9wPTExMDg2ODYjcG9zdDExMDg2
ODYNCg0KSSBoYXZlIHRvIHJvbGwgYmFjayBiZWZvcmUgTmF2aSBjb21taXRzIHRvIGdldCB3b3Jr
aW5nICdhbWQtc3RhZ2luZy1kcm0tbmV4dCcga2VybmVsLCBhZ2Fpbi4NCg0KTWF5YmUgeW91IGhh
dmUgc29tZSAnc3BhcmUnIHRpbWUgZGVzcGl0ZSBhbGwgeW91ciBOYXZpIGVuYWJsZW1lbnQgd29y
ayB0byBsaWZ0ICdhbWQtc3RhZ2luZy1kcm0tbmV4dCcgdG8gYXQgbGVhc3QgNS4yLXJjNiAodGhl
IFN0ZWFtIFRDUCB0aGluZykuDQoNCkdyZWV0aW5ncywNCkRpZXRlcg0KX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18NCmFtZC1nZnggbWFpbGluZyBsaXN0DQph
bWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4DQpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2FtZC1nZng=
