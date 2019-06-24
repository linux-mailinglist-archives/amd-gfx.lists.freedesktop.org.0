Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D8E7504DC
	for <lists+amd-gfx@lfdr.de>; Mon, 24 Jun 2019 10:50:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C75F8987A;
	Mon, 24 Jun 2019 08:50:32 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700072.outbound.protection.outlook.com [40.107.70.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 324D38987A
 for <amd-gfx@lists.freedesktop.org>; Mon, 24 Jun 2019 08:50:31 +0000 (UTC)
Received: from MN2PR12MB3312.namprd12.prod.outlook.com (20.179.83.160) by
 MN2PR12MB3023.namprd12.prod.outlook.com (20.178.242.26) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2008.16; Mon, 24 Jun 2019 08:50:29 +0000
Received: from MN2PR12MB3312.namprd12.prod.outlook.com
 ([fe80::842b:e55b:7196:50f5]) by MN2PR12MB3312.namprd12.prod.outlook.com
 ([fe80::842b:e55b:7196:50f5%6]) with mapi id 15.20.2008.014; Mon, 24 Jun 2019
 08:50:29 +0000
From: "Cui, Flora" <Flora.Cui@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amdgpu: fix scheduler timeout calc
Thread-Topic: [PATCH] drm/amdgpu: fix scheduler timeout calc
Thread-Index: AQHVKmnfrLQa+/IR2EO2XNtDTszxdQ==
Date: Mon, 24 Jun 2019 08:50:29 +0000
Message-ID: <1561366217-13261-1-git-send-email-flora.cui@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-clientproxiedby: HK0PR03CA0031.apcprd03.prod.outlook.com
 (2603:1096:203:2f::19) To MN2PR12MB3312.namprd12.prod.outlook.com
 (2603:10b6:208:106::32)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.7.4
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 31f18a9d-918b-46cd-5305-08d6f881021a
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3023; 
x-ms-traffictypediagnostic: MN2PR12MB3023:
x-microsoft-antispam-prvs: <MN2PR12MB302304438E13BF8F748588E7FAE00@MN2PR12MB3023.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1360;
x-forefront-prvs: 007814487B
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(366004)(396003)(39860400002)(346002)(376002)(136003)(199004)(189003)(8936002)(478600001)(5660300002)(52116002)(2616005)(50226002)(6486002)(102836004)(6512007)(68736007)(6436002)(3846002)(6116002)(476003)(486006)(316002)(71190400001)(256004)(71200400001)(14444005)(81166006)(81156014)(36756003)(66066001)(72206003)(305945005)(2906002)(86362001)(7736002)(99286004)(386003)(14454004)(8676002)(2501003)(6506007)(66946007)(73956011)(5640700003)(66476007)(66556008)(186003)(26005)(25786009)(53936002)(6916009)(64756008)(66446008)(4744005)(4326008)(2351001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3023;
 H:MN2PR12MB3312.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 0Ml0FAuLaypHP2LjJL2McwyGCUMsIZ/0UAXJ9c9KVS9XI8S8D2is292Cp/Dy3S0XR36LXMdggl5uqb4yVDX2FRVbsESu+2TKyH4HtxqLjxHhxV0MSbj3BA1iSaN9muoZixclqRbQ6DW4YYhGxNFvc29JjyQ6IDaEayK1CJ1yVJLjtluqssigzR2Tp6kaXvT4OrTPvvVVgx+J+IaEKaoYm5TpL3NLBDHxQ+PubW/VjbWL17c9FavJfa1xSIk9wVnNEHDfFHCgfRa+UTJ5lJ9/ciD33ITUk8pfxHqXfebvcVEec+GozaUTJmhiP+QbE0Iaqee1VjK4zOlCvqdC/TbKlnUP658WJRoS7IxM5ZuoI5Lvs6fBNUZ6pZdnl24uya3pnXXzHXioFz/VdMFkCPlbJ2N64YS76n1iJZxMdJ/FZ+k=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 31f18a9d-918b-46cd-5305-08d6f881021a
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jun 2019 08:50:29.5619 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fcui@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3023
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7nYCD5nKYXq0rIgERLvYLBb74rSk85cdPmDaLUD2Dqk=;
 b=vesGy98svUHbfZXfw4iUfBC46vCEFQsrUWWY+tK69CoB7u0bEzEkBHJAQUbb9s/kV9vU8g9Lakaxwo+5S0XFUJUvgrWpLgWh01dhPaIB9E7NolhSm3EsYDrS1hJJheUKhbxknqTeMMl0ET4R8ht7wz1KgVhvhPrtHE5LGAfSUhs=
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
Cc: "Cui, Flora" <Flora.Cui@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

c2NoZWR1bGVyIHRpbWVvdXQgaXMgaW4gamlmZmllcw0KDQpDaGFuZ2UtSWQ6IEkyNjcwOGMxNjNk
Yjk0M2ZmOGQ5MzBkZDgxYmNhYjRiNGI5ZDg0ZWIyDQpTaWduZWQtb2ZmLWJ5OiBGbG9yYSBDdWkg
PGZsb3JhLmN1aUBhbWQuY29tPg0KLS0tDQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1k
Z3B1X2ZlbmNlLmMgfCAzICsrKw0KIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKykNCg0K
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9mZW5jZS5jIGIv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2ZlbmNlLmMNCmluZGV4IGNiY2FhN2Mu
LjJlZGFhNmMgMTAwNjQ0DQotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVf
ZmVuY2UuYw0KKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2ZlbmNlLmMN
CkBAIC00ODEsNiArNDgxLDkgQEAgaW50IGFtZGdwdV9mZW5jZV9kcml2ZXJfaW5pdF9yaW5nKHN0
cnVjdCBhbWRncHVfcmluZyAqcmluZywNCiAJCQlicmVhazsNCiAJCX0NCiANCisJCWlmICh0aW1l
b3V0ICE9IE1BWF9TQ0hFRFVMRV9USU1FT1VUKQ0KKwkJCXRpbWVvdXQgPSBtc2Vjc190b19qaWZm
aWVzKHRpbWVvdXQpOw0KKw0KIAkJciA9IGRybV9zY2hlZF9pbml0KCZyaW5nLT5zY2hlZCwgJmFt
ZGdwdV9zY2hlZF9vcHMsDQogCQkJCSAgIG51bV9od19zdWJtaXNzaW9uLCBhbWRncHVfam9iX2hh
bmdfbGltaXQsDQogCQkJCSAgIHRpbWVvdXQsIHJpbmctPm5hbWUpOw0KLS0gDQoyLjcuNA0KDQpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1h
aWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
