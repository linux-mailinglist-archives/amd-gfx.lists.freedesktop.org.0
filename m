Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85BC0A20A2
	for <lists+amd-gfx@lfdr.de>; Thu, 29 Aug 2019 18:18:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4509B6E130;
	Thu, 29 Aug 2019 16:18:16 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr790071.outbound.protection.outlook.com [40.107.79.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 966986E12B
 for <amd-gfx@lists.freedesktop.org>; Thu, 29 Aug 2019 16:18:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Sl4mW+o3IsqZcArINKTnainzj6u3XJUDtSiL6FnQgQ+1xHIXMOuJ9cy8+XEssNgGaOv87oMRxGvaPyX21TAsRZgQFYi5c+TmORESmxkkze78NM8aVTLf871N2Zgnly1b0vT4vNtc7Y/RWCFQ8B0ygbCgANmXI/iaQKzk4RxVZEQ56jrm5sGRZPVlcDjaT2ANHohvBPGUBhqNgDzCfq/hNbx3KE0N2evqFyieM2CqcvzKGny03y79HT6nGnj/zoSbvPkRjcV7V9/sGId+V072RzA+uVffrA4JPp3jFOw314b99omFgi2DAhOFgmaOo2OQ4pKyPzvYwZaC8PVL+oR3Eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p2xoNOkST/A5lPWPkxD22u1RIHdSa8/sugrItTULX5Y=;
 b=UHgu4dNUT1eBHdb4LzGHrBFpNfBS8LH3eAZ6dbWfAB51Myhw2SuYRVRaP9foZvaEMK1pbwZIGPU15cE1A2m3Ns++ScMuKG5CBi6sqnZhbFqJLoiG4M5oj7g80rjVFXafjzmNZYy+1nJj4cXAqg81eDCoxQMaUWVkzMFnGW90Y/vYySpZ2HKcuwKlKFN28ZkeoGt//2dnBA+6W5UDu2SdVxcJHqdG2yWeLLZx1W149reepyQ7bSwctC2yX0rUDnguC6tAphD1+zn4WhQUhRoWe/sMdZZ7ozsF++HgXyYInan7MZqBmFHrQ4AXYGayqycf8imL8vjSKbFYjJXpGPzzNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM6PR12MB3947.namprd12.prod.outlook.com (10.255.174.156) by
 DM6PR12MB2860.namprd12.prod.outlook.com (20.179.71.25) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2220.18; Thu, 29 Aug 2019 16:18:13 +0000
Received: from DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::3d2a:29d4:df8:4d5]) by DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::3d2a:29d4:df8:4d5%2]) with mapi id 15.20.2199.021; Thu, 29 Aug 2019
 16:18:13 +0000
From: "Kuehling, Felix" <Felix.Kuehling@amd.com>
To: "Grodzovsky, Andrey" <Andrey.Grodzovsky@amd.com>, "Koenig, Christian"
 <Christian.Koenig@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 1/2] dmr/amdgpu: Avoid HW GPU reset for RAS.
Thread-Topic: [PATCH 1/2] dmr/amdgpu: Avoid HW GPU reset for RAS.
Thread-Index: AQHVXdtIbt+c9wcLM02KYbAzIAaCdqcRu5gAgABt3gCAAACwAIAAAIeAgAAkUIA=
Date: Thu, 29 Aug 2019 16:18:13 +0000
Message-ID: <3a39a720-ae2d-0019-aecc-422f0e3f27bb@amd.com>
References: <1567022426-6612-1-git-send-email-andrey.grodzovsky@amd.com>
 <85798da5-a4f1-28d3-c80f-9f262743cac9@gmail.com>
 <9a46188b-b528-0d1f-8c3f-b6ce5b73649f@amd.com>
 <8c2b0bf3-47ff-ea3b-a682-7ec76240be4d@amd.com>
 <1444ae5f-0997-d1ce-3e1e-23fea8822c88@amd.com>
In-Reply-To: <1444ae5f-0997-d1ce-3e1e-23fea8822c88@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-clientproxiedby: YTXPR0101CA0055.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:1::32) To DM6PR12MB3947.namprd12.prod.outlook.com
 (2603:10b6:5:1cb::28)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 54f416cb-83a6-4870-43ea-08d72c9c7dac
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM6PR12MB2860; 
x-ms-traffictypediagnostic: DM6PR12MB2860:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR12MB28608D3F9077C6B5B4C6B6AC92A20@DM6PR12MB2860.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4502;
x-forefront-prvs: 0144B30E41
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(39860400002)(376002)(396003)(346002)(136003)(189003)(199004)(6116002)(66946007)(966005)(66556008)(66476007)(2501003)(14454004)(8936002)(65956001)(86362001)(65806001)(66066001)(36756003)(64756008)(66446008)(81156014)(81166006)(31686004)(6436002)(71200400001)(71190400001)(6512007)(6306002)(110136005)(5660300002)(52116002)(486006)(476003)(54906003)(6246003)(58126008)(14444005)(53936002)(102836004)(99286004)(6506007)(6486002)(2906002)(31696002)(8676002)(478600001)(446003)(11346002)(2616005)(26005)(386003)(53546011)(186003)(7736002)(305945005)(4326008)(76176011)(3846002)(229853002)(25786009)(256004)(316002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB2860;
 H:DM6PR12MB3947.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: /kje9NBes1BvMzHwNddz9lwQzDUgCnRrOCPlRIgmqD4J345DPN3CqZ44SJBPlhSVLH5wmTFs+nr5p7u6hLIsWZ8SHibB1jkzcf4Hx6Fci+0/i9HzDKTtq366GPBe9td67jtJeaauNWKizshlSiUgI7RVld9Y9W0Efv8s6kgPsZ5Gc6Ru3y77ZYs6LZE9c1mkDCxKmATBXQPRci1wmZvsN6eS1fF40+D0j2JZY5iJ8MavpZ3kS/VUk3qMireoul88zWsY3QJiWBQMpSDKNv8aezMJTHI1eCC0l1MIDCA3W+Kb6mk2M+0ZFPDojr+hPRDWhBYDCvXXtn8W1bXULuUtmYIU3x/ZSm7xAlY6jqFkwvJfh+RdvrbWssafydJbUqr29YpDppXpov2jGKZFwDj7mQ9euP+1PkKcBrwLqmT5+yw=
Content-ID: <3AE7E444C0782243A98360C4EB515655@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 54f416cb-83a6-4870-43ea-08d72c9c7dac
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Aug 2019 16:18:13.3185 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gqE12Pdppn8YvccLiDMyKfwabLs+/5W+8Y9NOduG0RQ1TjXvpmW5KW/Ly92bbO+sTVK2cBcq4BtSwmhhu71cJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2860
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p2xoNOkST/A5lPWPkxD22u1RIHdSa8/sugrItTULX5Y=;
 b=OlCc7lIqFeXwFssgyD8yj7McfvXwdFitLg201gltM+U/ct1zXYK6v1I1kr/N+t784H2KCTCXhQeD3t/EV6rickWbjfIWwxlVDZefJsbpXpjNLf5oKwFydpJL/TyHjmMCGSjz+vRmRwT3IPRCLpPIHvaOCZ/lK38bgZtpiZjYLGk=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Felix.Kuehling@amd.com; 
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
Cc: "alexdeucher@gmail.com" <alexdeucher@gmail.com>, "Zhang,
 Hawking" <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gMjAxOS0wOC0yOSAxMDowOCBhLm0uLCBHcm9kem92c2t5LCBBbmRyZXkgd3JvdGU6DQo+DQo+
IEFncmVlLCB0aGUgcGxhY2VtZW50IG9mIGFtZGdwdV9hbWRrZmRfcHJlL3Bvc3QgX3Jlc2V0IGlu
IA0KPiBhbWRncHVfZGV2aWNlX2xvY2svdW5sb2NrX2FkZXYgaXMgYSBiaXQgd2llcmQuDQo+DQph
bWRncHVfZGV2aWNlX3Jlc2V0X3NyaW92IGFscmVhZHkgY2FsbHMgYW1kZ3B1X2FtZGtmZF9wcmUv
cG9zdF9yZXNldCANCml0c2VsZiB3aGlsZSBpdCBoYXMgZXhjbHVzaXZlIGFjY2VzcyB0byB0aGUg
R1BVLiBJdCB3b3VsZCBtYWtlIHNlbnNlIHRvIA0KbW92ZSB0aGUgc2FtZSBjYWxscyBpbnRvIGFt
ZGdwdV9kb19hc2ljX3Jlc2V0IGZvciB0aGUgYmFyZS1tZXRhbCBjYXNlLg0KDQpSZWdhcmRzLA0K
IMKgIEZlbGl4DQoNCg0KPiBBbmRyZXkNCj4NCj4gT24gOC8yOS8xOSAxMDowNiBBTSwgS29lbmln
LCBDaHJpc3RpYW4gd3JvdGU6DQo+Pj4gRmVsaXggYWR2aXNlZCB0aGF0IHRoZSB3YXkgdG8gc3Rv
cCBhbGwgS0ZEIGFjdGl2aXR5IGlzIHNpbXBseSB0byBOT1QNCj4+PiBjYWxsIGFtZGdwdV9hbWRr
ZmRfcG9zdF9yZXNldCBzbyB0aGF0IHdoeSBJIGFkZGVkIHRoaXMuIERvIHlvdSBtZWFuIHlvdQ0K
Pj4+IHByZWZlciBhbWRncHVfYW1ka2ZkX3Bvc3RfcmVzZXQgdG8gYmUgb3V0c2lkZSBvZiBhbWRn
cHVfZGV2aWNlX3VubG9ja19hZGV2ID8NCj4+IFllcywgZXhhY3RseS4gSXQgZG9lc24ndCBzZWVt
cyB0byBiZSByZWxhdGVkIHRvIHRoZSB1bmxvY2sgb3BlcmF0aW9uIGluDQo+PiB0aGUgZmlyc3Qg
cGxhY2UsIGJ1dCByYXRoZXIgb25seSBzaWduYWxzIHRoZSBLRkQgdGhhdCB0aGUgcmVzZXQgaXMN
Cj4+IGNvbXBsZXRlZC4NCj4+DQo+PiBDaHJpc3RpYW4uDQo+Pg0KPg0KPiBfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXw0KPiBhbWQtZ2Z4IG1haWxpbmcgbGlz
dA0KPiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiBodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZngNCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vYW1kLWdmeA==
