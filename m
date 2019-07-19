Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 72CF96E299
	for <lists+amd-gfx@lfdr.de>; Fri, 19 Jul 2019 10:34:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06B8C6E5C7;
	Fri, 19 Jul 2019 08:34:47 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam05on0623.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe51::623])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDE2A6E5C7
 for <amd-gfx@lists.freedesktop.org>; Fri, 19 Jul 2019 08:34:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RV/vyb/AC5YtH0AQ+SE1YK14YQ1lSddIB9HdOdwcxzw/Jy/fFNC7AjA+cM4B15coPXTXuIiyikMv5Hxl1V6w2jcIkqgNOSAkxfP3tZkRWosu5Vu0pxg6UJjhvMsv4fK/UI0mufVl9LrzamAEt48cFqI78A9Y75qsnlQpLqg/4K78yauNCA3JPmt7ydJ1ZX3X8Gv4zRMeZOvRFBXh2znNo3JuHxvAtkKlZTAnBAO/nv6B6KH6d9UijFP6z5YFlxmJCfHxPLxeWiGH7kirgkIANq66c2REzlPgvN2Q3ooGVnCrCVAHUqulkzQQ/qyAKapzW8kGnZrK/189/Jof2ala3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ez6acKEDsAOPbS64rhtAoOPL1CUZR86EmG/aw0MO2t0=;
 b=IrmzAcR3tS3w5UdTQwxMcaCBgkRd/aJg7ZnHyOXxMWyXA9CLGBs8SKqdeByxmuKyY6hAeib0NAo22jei3MsmsVxMhGSC2pYxqQKs5GpNBvomqIkOKJlRGcKsTRV64yymNCBczrvgegB4d9nrQsZp6WmLfEQdj6A6ea2+Wu21Dg5oBt9s0x4Gi+4/nDYORjCiQRXv7tmC4SXg4J9uAt37l1dwJYAjd4sA3Vn9YcCGY2DANDFoMMpvHq5Ss0b8V9j21hxPtgbT5eqMjysXDnxBoNORh1AdlypdXs1H+RhOj9a4eiCrFbxi/eK7wkF2W+Ee5T45CMxIxYMXGvbV1t/DZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from MN2PR12MB3312.namprd12.prod.outlook.com (20.179.83.160) by
 MN2PR12MB3853.namprd12.prod.outlook.com (10.255.237.150) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.14; Fri, 19 Jul 2019 08:34:43 +0000
Received: from MN2PR12MB3312.namprd12.prod.outlook.com
 ([fe80::b475:24f4:8515:731]) by MN2PR12MB3312.namprd12.prod.outlook.com
 ([fe80::b475:24f4:8515:731%4]) with mapi id 15.20.2073.012; Fri, 19 Jul 2019
 08:34:43 +0000
From: "Cui, Flora" <fcui@amd.com>
To: =?utf-8?B?TWljaGVsIETDpG56ZXI=?= <michel@daenzer.net>, "Cui, Flora"
 <Flora.Cui@amd.com>
Subject: Re: [PATCH libdrm 1/2] tests/amdgpu: fix for dispatch/draw test
Thread-Topic: [PATCH libdrm 1/2] tests/amdgpu: fix for dispatch/draw test
Thread-Index: AQHVPUBTWR4E4CBynk6thSpMif7cJabQHI4AgAFXboCAABwDgIAADxeA
Date: Fri, 19 Jul 2019 08:34:43 +0000
Message-ID: <0a3b4a91-b679-6de3-f02c-5f5a6dfcb82d@amd.com>
References: <1563437433-4157-1-git-send-email-flora.cui@amd.com>
 <1c9de651-bbb2-6802-e729-182cab5ca427@gmail.com>
 <febeaec7-db65-e18d-d073-d7e19f972edb@amd.com>
 <39c1c37e-89d8-bb00-2cc6-aa048aed77c8@daenzer.net>
In-Reply-To: <39c1c37e-89d8-bb00-2cc6-aa048aed77c8@daenzer.net>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
x-originating-ip: [180.167.199.189]
x-clientproxiedby: HK0PR03CA0050.apcprd03.prod.outlook.com
 (2603:1096:203:52::14) To MN2PR12MB3312.namprd12.prod.outlook.com
 (2603:10b6:208:106::32)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8fd96f8c-0d3b-415b-073b-08d70c23f2a3
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3853; 
x-ms-traffictypediagnostic: MN2PR12MB3853:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <MN2PR12MB3853E1448AF021349CCA4427FACB0@MN2PR12MB3853.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 01039C93E4
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(396003)(39860400002)(366004)(346002)(136003)(199004)(189003)(6116002)(3846002)(4744005)(11346002)(36756003)(2616005)(476003)(2906002)(65826007)(8676002)(58126008)(71200400001)(26005)(31686004)(229853002)(256004)(6512007)(71190400001)(53546011)(53936002)(102836004)(81156014)(66446008)(6306002)(316002)(446003)(65956001)(8936002)(6246003)(66946007)(31696002)(64756008)(66476007)(65806001)(305945005)(66066001)(66556008)(7736002)(386003)(99286004)(14454004)(6486002)(64126003)(478600001)(6636002)(6436002)(4326008)(110136005)(966005)(486006)(52116002)(76176011)(186003)(25786009)(81166006)(5660300002)(6506007)(68736007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3853;
 H:MN2PR12MB3312.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: K0xecfQbSCt5I6+Sd8xyVGPWkepF2/ZoGhEkunoLbgfewS2pigqg8KvTgdXkDeB2VHzp1nbchmMNQgPmNTC7e1hsN75VNwTPDDd4sYsGsg7Em2F8O31r/v1v2kuRXmvlPPRztTbtyIM75d1RtdQ8qEWbRdQWjiUmNbEGu2+6tv+uMw+0LHkx1RqQ2BsUCMUAAOp3Bbd7dOUZq1i6vsHEioXcK3o93xmFQepoebIbUwOGjJ6NfXqcBy43Tlyyi9gMyK+UeVgaYXp37yK+YfhiFsjoRsAiXt20axK15J+5sPm1KMNAjxUzVs5MwVbEP3asAt6qVi6aeNC0PhFMbWzJsDo6KvjYVVeR1WTdEGt/s1UyCpN5GHe8kSzChVw20+/2QHzEAC9kHFr44EJdn4TjUvORoappmITMH0T6dVV/pV4=
Content-ID: <4FF7A922FF46CF4D81F262A672C0BB57@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8fd96f8c-0d3b-415b-073b-08d70c23f2a3
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jul 2019 08:34:43.4411 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fcui@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3853
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ez6acKEDsAOPbS64rhtAoOPL1CUZR86EmG/aw0MO2t0=;
 b=Xie9kANR8zTeizKyI/lLSCOVfrUDlVo9/XbELo+OaHCoft3OqUy/ilDlDuWxLG3uwE96AkPfZC07fVi73UCi+jWvc2RTCnjmWzxO8dqA2Ch+yK+hwYskF0dfYcOI9uOjmm73dYxSDo0BG0jNw01orELabc3bmunZFxawxS+nv/4=
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
Cc: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

dGhlIENoYW5nZS1JZCB0YWdzIGFyZSBhZGRlZCBhdXRvbWF0aWNhbGx5LiBkbyB5b3Uga25vdyBo
b3cgdG8gZ2V0IHJpZCBvZiBpdD8NCg0K5ZyoIDcvMTkvMjAxOSAzOjQwIFBNLCBNaWNoZWwgRMOk
bnplciDlhpnpgZM6DQo+IE9uIDIwMTktMDctMTkgODowMCBhLm0uLCBDdWksIEZsb3JhIHdyb3Rl
Og0KPj4gSGkgTWljaGVsLA0KPj4NCj4+IFRoZXNlIDIgY29tbWl0cyBpcyBwdXNoZWQgdG8gaHR0
cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL2ZjdWkvZHJtLg0KPj4gQ291bGQgeW91IGhlbHAg
dG8gbWVyZ2UgdG8gbWVzYS9kcm0/DQo+IFBsZWFzZSByZW1vdmUgdGhlIENoYW5nZS1JZCB0YWdz
Lg0KPg0KPg0KPiBQLlMuIFdoZW4gYSBjb21taXQgbG9nIGxpc3RzIG11bHRpcGxlIHNlcGFyYXRl
IGNoYW5nZXMsIGl0J3MgYSBnb29kDQo+IGluZGljYXRpb24gdGhhdCB0aGUgY2hhbmdlIHNob3Vs
ZCBiZSBzcGxpdCB1cC4NCj4NCj4gUC5QLlMuIFdlJ2xsIG5lZWQgdG8gZmlndXJlIG91dCBhIGJl
dHRlciB3YXkgdG8gaGFuZGxlIG1lcmdpbmcgbGliZHJtDQo+IGNoYW5nZXMuIE15IHBlcnNvbmFs
IHByZWZlcmVuY2Ugd291bGQgYmUgdG8gZW5hYmxlIEdpdExhYiBtZXJnZSByZXF1ZXN0cw0KPiBm
b3IgaXQuDQo+DQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
