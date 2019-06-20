Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F1D64DA1D
	for <lists+amd-gfx@lfdr.de>; Thu, 20 Jun 2019 21:23:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C0F56E4AE;
	Thu, 20 Jun 2019 19:23:49 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr820043.outbound.protection.outlook.com [40.107.82.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 795AA6E4AE
 for <amd-gfx@lists.freedesktop.org>; Thu, 20 Jun 2019 19:23:47 +0000 (UTC)
Received: from BL0PR12MB2580.namprd12.prod.outlook.com (52.132.27.147) by
 BL0PR12MB2483.namprd12.prod.outlook.com (52.132.11.146) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1987.12; Thu, 20 Jun 2019 19:23:42 +0000
Received: from BL0PR12MB2580.namprd12.prod.outlook.com
 ([fe80::991:7474:933e:d61]) by BL0PR12MB2580.namprd12.prod.outlook.com
 ([fe80::991:7474:933e:d61%4]) with mapi id 15.20.1987.014; Thu, 20 Jun 2019
 19:23:42 +0000
From: "Zeng, Oak" <Oak.Zeng@amd.com>
To: "Kuehling, Felix" <Felix.Kuehling@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH 1/2] drm/amdkfd: Add chained_runlist_idle_disable flag to
 pm4_mes_runlist
Thread-Topic: [PATCH 1/2] drm/amdkfd: Add chained_runlist_idle_disable flag to
 pm4_mes_runlist
Thread-Index: AQHVJ510MSBuJg2pPEm3H7nb3OJCdKak6/4w
Date: Thu, 20 Jun 2019 19:23:42 +0000
Message-ID: <BL0PR12MB2580EA675A1B1F9AE6EC4B3F80E40@BL0PR12MB2580.namprd12.prod.outlook.com>
References: <20190620192155.20226-1-Felix.Kuehling@amd.com>
In-Reply-To: <20190620192155.20226-1-Felix.Kuehling@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [99.228.209.96]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 307a239b-c2a2-4374-df00-08d6f5b4ce6b
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BL0PR12MB2483; 
x-ms-traffictypediagnostic: BL0PR12MB2483:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <BL0PR12MB2483FB058885A74BCD1B47BB80E40@BL0PR12MB2483.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3173;
x-forefront-prvs: 0074BBE012
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(376002)(366004)(396003)(39860400002)(136003)(346002)(199004)(189003)(13464003)(73956011)(66946007)(2906002)(76116006)(68736007)(25786009)(4326008)(66066001)(86362001)(9686003)(5660300002)(55016002)(305945005)(71190400001)(14444005)(6306002)(256004)(53936002)(110136005)(52536014)(7736002)(71200400001)(316002)(229853002)(72206003)(478600001)(14454004)(486006)(446003)(33656002)(6436002)(74316002)(11346002)(476003)(966005)(7696005)(2501003)(99286004)(76176011)(81156014)(81166006)(3846002)(6116002)(8676002)(53546011)(66556008)(6506007)(26005)(102836004)(8936002)(6246003)(64756008)(186003)(66446008)(66476007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BL0PR12MB2483;
 H:BL0PR12MB2580.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: qLx7L9A86NS8qSHGYXGwaNttGlRCItMHBefFfgLhAy2i3H8S0n/Fg87xFP1gh3vKmUEWC5XE5y8qwM4+Qc7itqCKJBg5ilzQKXtfSiF3ZZEUnrFnQYCEQDSf5U/OMEYT28TnxPI7TfmZsfV4hbb+YIRueI20DuPhXNeSSspkSjH+RNo0HzLiYHghcLUybAy9UsJwRXwncobuw62CCT4JLOJSIKuwdGhW0CSjol0e+Eb5U6MCoOZRcNOZkY/jHL4VJOGVz9Aau1nH1R9/Seg6eOKZjqItLO/e2c11t5UL2Y50IP8fNdWE2JfH154RxSNZz1tz7MwxMYnKKvWthaVaP3q+1/xmhvNtEdtk/FpUw6Lvlc4inRO+kw112TjXhukFBpENHCeYe7+tZPE2uogc+TX6UWivfB4xjSeLxM0NsBM=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 307a239b-c2a2-4374-df00-08d6f5b4ce6b
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jun 2019 19:23:42.4169 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ozeng@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2483
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pR2aKUcF2BtCbmAkLPmF80+Ldz7h8SYCjihZjybd6x0=;
 b=fsYDHwObuQh6T9CkFZ560FlIiZLuLhMPIOpVM5G8vpj3faV97NavP4j5+U0cbqy7hLuNT0TTGYYBAyL5AHpM3fQIqJ1ppszWy9FJYI0jVpESNItEpy4IKjWSzcXnmIdQxPoZeMOMRChrcAv1LOngW9AtO3vD78BopYM78OS3Bu4=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Oak.Zeng@amd.com; 
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
Cc: "Kuehling, Felix" <Felix.Kuehling@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

SGkgRmVsaXgsDQoNCkRvZXMgdGhpcyByZXF1aXJlIGEgTUVDIGZpcm13YXJlIGNoYW5nZT8NCg0K
UmVnYXJkcywNCk9haw0KDQotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTogYW1kLWdm
eCA8YW1kLWdmeC1ib3VuY2VzQGxpc3RzLmZyZWVkZXNrdG9wLm9yZz4gT24gQmVoYWxmIE9mIEt1
ZWhsaW5nLCBGZWxpeA0KU2VudDogVGh1cnNkYXksIEp1bmUgMjAsIDIwMTkgMzoyMiBQTQ0KVG86
IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQpDYzogS3VlaGxpbmcsIEZlbGl4IDxGZWxp
eC5LdWVobGluZ0BhbWQuY29tPg0KU3ViamVjdDogW1BBVENIIDEvMl0gZHJtL2FtZGtmZDogQWRk
IGNoYWluZWRfcnVubGlzdF9pZGxlX2Rpc2FibGUgZmxhZyB0byBwbTRfbWVzX3J1bmxpc3QNCg0K
TmV3IGZsYWcgdG8gZGlzYWJsZSBhbiBpZGxlIHJ1bmxpc3Qgb3B0aW1pemF0aW9uIHRoYXQgaXMg
Y2F1c2luZyBzb2Z0IGhhbmdzIHdpdGggc29tZSBkaWZmdWx0LXRvLXJlcHJvZHVjZSBjdXN0b21l
ciB3b3JrbG9hZHMuIFRoaXMgd2lsbCBzZXJ2ZSBhcyBhIHdvcmthcm91bmQgdW50aWwgdGhlIHBy
b2JsZW0gY2FuIGJlIHJlcHJvZHVjZWQgYW5kIHRoZSByb290LWNhdXNlIGRldGVybWluZWQuDQoN
ClNpZ25lZC1vZmYtYnk6IEZlbGl4IEt1ZWhsaW5nIDxGZWxpeC5LdWVobGluZ0BhbWQuY29tPg0K
LS0tDQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX3BtNF9oZWFkZXJzX2FpLmggfCAy
ICstDQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pDQoNCmRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfcG00X2hlYWRlcnNfYWku
aCBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9wbTRfaGVhZGVyc19haS5oDQppbmRl
eCA0OWFiNjZiNzAzZmEuLmUzZTIxNDA0Y2ZhMCAxMDA2NDQNCi0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1ka2ZkL2tmZF9wbTRfaGVhZGVyc19haS5oDQorKysgYi9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGtmZC9rZmRfcG00X2hlYWRlcnNfYWkuaA0KQEAgLTEyMCw3ICsxMjAsNyBAQCBzdHJ1
Y3QgcG00X21lc19ydW5saXN0IHsNCiAJCQl1aW50MzJfdCBpYl9zaXplOjIwOw0KIAkJCXVpbnQz
Ml90IGNoYWluOjE7DQogCQkJdWludDMyX3Qgb2ZmbG9hZF9wb2xsaW5nOjE7DQotCQkJdWludDMy
X3QgcmVzZXJ2ZWQyOjE7DQorCQkJdWludDMyX3QgY2hhaW5lZF9ydW5saXN0X2lkbGVfZGlzYWJs
ZToxOw0KIAkJCXVpbnQzMl90IHZhbGlkOjE7DQogCQkJdWludDMyX3QgcHJvY2Vzc19jbnQ6NDsN
CiAJCQl1aW50MzJfdCByZXNlcnZlZDM6NDsNCi0tDQoyLjE3LjENCg0KX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18NCmFtZC1nZnggbWFpbGluZyBsaXN0DQph
bWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4DQpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2FtZC1nZng=
