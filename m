Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0568ABAFB1
	for <lists+amd-gfx@lfdr.de>; Mon, 23 Sep 2019 10:35:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 730DA6E239;
	Mon, 23 Sep 2019 08:35:33 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr740049.outbound.protection.outlook.com [40.107.74.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45BE36E231
 for <amd-gfx@lists.freedesktop.org>; Mon, 23 Sep 2019 08:35:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qpq9pBuNQUWEzY+7QneHV39Q0aUrORSyu0nrZeRV/ACtQG6Pi9I4uqDZjd5w7gG0Z9YQMjwiWu1nIArwlrPJLkhKMA/8Ka/rv2mPqP+T9at1mW1JukCp/tmxvRJEbjP+d9uj2oD43IWZQ5nASDWmUTLIgJDgxskJq1gchqBOXFLB5KFauxw/Hhkw1lKUnznP5+KkQyNcLTElSz9YCKlTqI7HFk0LLjcyoIvZWW2DL8wnc/BrI27zZP5EPgKzjYnz1Jwm/psiC9UqQ/GXZG3vs127eN2bo02lvdWQXCUD9LXCY8cWkrIhMGiV9rmLhOrTbsTyhkw9MW4mKBOwLbIzUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RqKN/Vq4TS4cNtB5lfK61JAgx4c89NELvDNRg5csCAc=;
 b=Bi3StuybNCWw3gHUUdOC04yEtQWpLFa3d1dbcEs+uYrVH3rqFD2xqJpD4IEhzdvEDypY0VEtFpQdl80UbnDRcjgUHq5ORPxBEvhnwnI7TY/Hnklvhrm9nzaz71T2bsUDXS8HDlpu1mAXbcrJBWdy9CU7B+OG4jFbD8UO+MjfoWglaHg/oGrGCkMMHqMR0FmsNgNW4jZpkEBCwG4zC62U58aOa6ZDlu1A90InP65GSyqJEWBIssPyYwdjjlIhHebTHL0cP2nylgvHYyWRq4qqOSlaYYECfznchEJ8nXCtIonqWBNCu8BCzUvPJ0NA2XYs/hLvvF0dMQFV0kuaeZROTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3598.namprd12.prod.outlook.com (20.178.244.84) by
 MN2PR12MB3389.namprd12.prod.outlook.com (20.178.242.161) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.23; Mon, 23 Sep 2019 08:35:30 +0000
Received: from MN2PR12MB3598.namprd12.prod.outlook.com
 ([fe80::19b5:2b97:5b3c:8b2a]) by MN2PR12MB3598.namprd12.prod.outlook.com
 ([fe80::19b5:2b97:5b3c:8b2a%7]) with mapi id 15.20.2284.023; Mon, 23 Sep 2019
 08:35:30 +0000
From: "Feng, Kenneth" <Kenneth.Feng@amd.com>
To: "Wang, Kevin(Yang)" <Kevin1.Wang@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH] drm/amd/powerplay: remove duplicate macro of
 smu_get_uclk_dpm_states
Thread-Topic: [PATCH] drm/amd/powerplay: remove duplicate macro of
 smu_get_uclk_dpm_states
Thread-Index: AQHVceOELP2ZLFsHp0W/X5YJ+4Od16c475pA
Date: Mon, 23 Sep 2019 08:35:30 +0000
Message-ID: <MN2PR12MB3598D6DDF4D90F4F726B94DE8E850@MN2PR12MB3598.namprd12.prod.outlook.com>
References: <20190923074954.830-1-kevin1.wang@amd.com>
In-Reply-To: <20190923074954.830-1-kevin1.wang@amd.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4f153501-5b5c-4c4b-04f0-08d74000fe06
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600167)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3389; 
x-ms-traffictypediagnostic: MN2PR12MB3389:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB3389DC20099869AA83B329078E850@MN2PR12MB3389.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:274;
x-forefront-prvs: 0169092318
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(136003)(376002)(346002)(39860400002)(366004)(13464003)(199004)(189003)(71190400001)(71200400001)(66476007)(7696005)(66946007)(76116006)(52536014)(66556008)(8676002)(64756008)(66446008)(229853002)(14454004)(6436002)(9686003)(316002)(2501003)(76176011)(66066001)(33656002)(86362001)(54906003)(7736002)(305945005)(478600001)(55016002)(110136005)(476003)(8936002)(486006)(446003)(2906002)(11346002)(5660300002)(4326008)(25786009)(74316002)(53546011)(6506007)(256004)(26005)(6246003)(186003)(6116002)(3846002)(102836004)(81156014)(81166006)(99286004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3389;
 H:MN2PR12MB3598.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 2HecROQodM2XUGKrAJBLvzI4UTyNUE3uaL/tHqrqL0LBSxEV13N3gMcN1IhnBsqgdKpvSrBlRpHsp+kdiF7rICluRIMp1v+0+D4x1XhJNW4kKDaxZ1JclBAWsAQzUA++04yLEJceFGajnqV8c2523UHSpnoDiB56lGahtv3iRqxetWN91iCsJ4B9KgibcuJiuDscNO19iHVL8KZ4jZFfpcq0N/QlnpNEP5GyhoYBSUD99h9w8A0O6REEbbRj8vguuV4tNYUR2s/2EYVZbb3IuzjMMZZef8Weh8POOnHhMgKSS9FvKmBn1PmBaBq7WKaX4yJYL/sVgaqXIuh7kOrFfWKONLfEaE+kQH8nAtBsCtEqSE9JgJdcVc0BPSF02vz95KdwdwOhS7LuYEzkoxhDv7YXkAmb37Uzgqu1QDeFIvc=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f153501-5b5c-4c4b-04f0-08d74000fe06
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Sep 2019 08:35:30.1439 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aXNFrmK+0RyXYYXN9s1Gs9uQnl+xK9FtnCf+B2zP6PIAMh2p3ryq+Jjhnk8NN8LR
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3389
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RqKN/Vq4TS4cNtB5lfK61JAgx4c89NELvDNRg5csCAc=;
 b=V+BGeDbJQz2A9D3qArcl82w33LTG/Wr7v3c7o1aWd5eWoGjM7wUL254UsRGJfqSKvwjYgmtb5QeYPiZjovfecLO2Bti/edLzIT2AszOQ5O8xgP0cVVSGI3VE5jfe/7xqnke/f2Z/LUPAIpSFe9drEdBltAlPmkcDdm5rO8gfDxU=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Kenneth.Feng@amd.com; 
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
Cc: "Liang, Prike" <Prike.Liang@amd.com>, "Huang, Ray" <Ray.Huang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

UmV2aWV3ZWQtYnk6IEtlbm5ldGggRmVuZyA8a2VubmV0aC5mZW5nQGFtZC5jb20+CgoKLS0tLS1P
cmlnaW5hbCBNZXNzYWdlLS0tLS0KRnJvbTogV2FuZywgS2V2aW4oWWFuZykgClNlbnQ6IE1vbmRh
eSwgU2VwdGVtYmVyIDIzLCAyMDE5IDM6NTAgUE0KVG86IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCkNjOiBIdWFuZywgUmF5IDxSYXkuSHVhbmdAYW1kLmNvbT47IEZlbmcsIEtlbm5ldGgg
PEtlbm5ldGguRmVuZ0BhbWQuY29tPjsgTGlhbmcsIFByaWtlIDxQcmlrZS5MaWFuZ0BhbWQuY29t
PjsgV2FuZywgS2V2aW4oWWFuZykgPEtldmluMS5XYW5nQGFtZC5jb20+ClN1YmplY3Q6IFtQQVRD
SF0gZHJtL2FtZC9wb3dlcnBsYXk6IHJlbW92ZSBkdXBsaWNhdGUgbWFjcm8gb2Ygc211X2dldF91
Y2xrX2RwbV9zdGF0ZXMKCnJlbW92ZSBkdXBsaWNhdGUgbWFjcm8gb2Ygc211X2dldF91Y2xrX2Rw
bV9zdGF0ZXMKCmZpeCBjb21taXQ6CmRybS9hbWQvcG93ZXJwbGF5OiBhZGQgdGhlIGludGVyZmFj
ZSBmb3IgZ2V0dGluZyB1bHRpbWF0ZSBmcmVxdWVuY3kgdjMKClNpZ25lZC1vZmYtYnk6IEtldmlu
IFdhbmcgPGtldmluMS53YW5nQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dl
cnBsYXkvaW5jL2FtZGdwdV9zbXUuaCB8IDIgLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGRlbGV0aW9u
cygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2luYy9hbWRn
cHVfc211LmggYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9pbmMvYW1kZ3B1X3NtdS5o
CmluZGV4IDQ1ZGEyMWRjMjM1Ni4uNWEwMDU5YjlhZWM5IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dw
dS9kcm0vYW1kL3Bvd2VycGxheS9pbmMvYW1kZ3B1X3NtdS5oCisrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvcG93ZXJwbGF5L2luYy9hbWRncHVfc211LmgKQEAgLTc1Miw4ICs3NTIsNiBAQCBzdHJ1
Y3Qgc211X2Z1bmNzCiAJKChzbXUpLT5wcHRfZnVuY3MtPmdldF91Y2xrX2RwbV9zdGF0ZXMgPyAo
c211KS0+cHB0X2Z1bmNzLT5nZXRfdWNsa19kcG1fc3RhdGVzKChzbXUpLCAoY2xvY2tzX2luX2to
eiksIChudW1fc3RhdGVzKSkgOiAwKSAgI2RlZmluZSBzbXVfZ2V0X21heF9zdXN0YWluYWJsZV9j
bG9ja3NfYnlfZGMoc211LCBtYXhfY2xvY2tzKSBcCiAJKChzbXUpLT5mdW5jcy0+Z2V0X21heF9z
dXN0YWluYWJsZV9jbG9ja3NfYnlfZGMgPyAoc211KS0+ZnVuY3MtPmdldF9tYXhfc3VzdGFpbmFi
bGVfY2xvY2tzX2J5X2RjKChzbXUpLCAobWF4X2Nsb2NrcykpIDogMCkgLSNkZWZpbmUgc211X2dl
dF91Y2xrX2RwbV9zdGF0ZXMoc211LCBjbG9ja3NfaW5fa2h6LCBudW1fc3RhdGVzKSBcCi0JKChz
bXUpLT5wcHRfZnVuY3MtPmdldF91Y2xrX2RwbV9zdGF0ZXMgPyAoc211KS0+cHB0X2Z1bmNzLT5n
ZXRfdWNsa19kcG1fc3RhdGVzKChzbXUpLCAoY2xvY2tzX2luX2toeiksIChudW1fc3RhdGVzKSkg
OiAwKQogI2RlZmluZSBzbXVfYmFjb19pc19zdXBwb3J0KHNtdSkgXAogCSgoc211KS0+ZnVuY3Mt
PmJhY29faXNfc3VwcG9ydD8gKHNtdSktPmZ1bmNzLT5iYWNvX2lzX3N1cHBvcnQoKHNtdSkpIDog
ZmFsc2UpICAjZGVmaW5lIHNtdV9iYWNvX2dldF9zdGF0ZShzbXUsIHN0YXRlKSBcCi0tCjIuMTcu
MQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdm
eCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
