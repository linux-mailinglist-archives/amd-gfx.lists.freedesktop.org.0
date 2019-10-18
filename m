Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EDB59DCD04
	for <lists+amd-gfx@lfdr.de>; Fri, 18 Oct 2019 19:49:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DA906E13F;
	Fri, 18 Oct 2019 17:49:03 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr740050.outbound.protection.outlook.com [40.107.74.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35DE36E13F
 for <amd-gfx@lists.freedesktop.org>; Fri, 18 Oct 2019 17:49:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AYXqyDk8ZONYNOH1QS1IMjg6QZRJIweTPjsk8rB/a86WK9Y9BciQH+kq5Jv9C8LrIvrQUgrwR97AuOS/x9ZmI56lTthFBAKbM8lyK7knDGkNipMn38s0srDT2wYRaVsi2aseHQuD10UujuB9eBLzCkexYoQXZM0QlBn9mlZMt36yGR+Turgmje05idl5KlG+Zp4m4XCkbXhAQt82558NQwav8xqzWV1sQ/xQkEX5Q7rc0kFXU31py1D6QYlOFw1RlvaSdpc1ulkMw96X5mZEoBCobMGW+fC00C39BVF1oAxQEciuDA40coRWvNHMEnRWXwWsOpBe7VD64morlCG4kQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HIsOH1fYM2Yf8pIKNQDr0zIViey0LyfR0u0Efp/y5s0=;
 b=Pv2KBsruvEKK2uJjoU5VdwIygFAtbv9NM/OWGt55fBJ7LYKYDYyLIYq60PWfkbr3xyJFu8Mr4lc5qq3lb6YbhqxDjtILucCvzsC0lFMesAr/BfJnRLI1WaCXr1uW+RvR6VMU1DN63WBMKMSS0Lepyidy6/2AqtrKdadLhbTsSY35C4CzWdroDcAhkCj5g49UxOfwQ7T8BMrVnC6dvYdERKmLw12sxVsFzYQ1qzdI4J3M3WrEJyFVtTHzehPZcZhFsy7/99thp8KwvlEt7nSk8BTy/dg4p6MnbNwKoHvW9Trflra0R9hj6Tag+m5t6240WQhx4lsT063iQgGjLD3YnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CY4PR1201MB2533.namprd12.prod.outlook.com (10.172.120.151) by
 CY4PR1201MB2487.namprd12.prod.outlook.com (10.172.116.22) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2367.20; Fri, 18 Oct 2019 17:48:58 +0000
Received: from CY4PR1201MB2533.namprd12.prod.outlook.com
 ([fe80::2475:bb90:4a03:a508]) by CY4PR1201MB2533.namprd12.prod.outlook.com
 ([fe80::2475:bb90:4a03:a508%8]) with mapi id 15.20.2347.026; Fri, 18 Oct 2019
 17:48:58 +0000
From: "Russell, Kent" <Kent.Russell@amd.com>
To: "Kim, Jonathan" <Jonathan.Kim@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH 1/2] Revert "drm/amdgpu: fix compiler warnings for df
 perfmons"
Thread-Topic: [PATCH 1/2] Revert "drm/amdgpu: fix compiler warnings for df
 perfmons"
Thread-Index: AQHVhdm9xyoBbl6ByUalsiWAYCIS6adgrJ7g
Date: Fri, 18 Oct 2019 17:48:58 +0000
Message-ID: <CY4PR1201MB2533EE0E3626C27ECA7C90D9856C0@CY4PR1201MB2533.namprd12.prod.outlook.com>
References: <20191018172934.24716-1-jonathan.kim@amd.com>
In-Reply-To: <20191018172934.24716-1-jonathan.kim@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2607:fea8:1c80:d46:49d1:7475:66a2:acab]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2b4a9576-140b-4316-d80c-08d753f3743f
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: CY4PR1201MB2487:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CY4PR1201MB2487755008AC1F6CFBAFBC32856C0@CY4PR1201MB2487.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3044;
x-forefront-prvs: 01949FE337
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(346002)(396003)(366004)(376002)(39860400002)(13464003)(189003)(199004)(9686003)(55016002)(66476007)(66446008)(6306002)(66556008)(76116006)(66946007)(64756008)(6246003)(4326008)(86362001)(52536014)(2501003)(2906002)(6436002)(6116002)(74316002)(305945005)(7736002)(102836004)(53546011)(229853002)(6506007)(256004)(966005)(186003)(54906003)(478600001)(110136005)(7696005)(14454004)(76176011)(99286004)(71190400001)(33656002)(316002)(71200400001)(46003)(11346002)(486006)(476003)(446003)(8936002)(81166006)(81156014)(5660300002)(25786009)(8676002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR1201MB2487;
 H:CY4PR1201MB2533.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 75t8xdiHBXckvwc3bZ22qrGfWNtyJwyuTD1a8VDuIvmVyqt1ae0Nk1BoUlmNL4XvetnqwtvNUCgdpMo4XlbzULdDXZqUEiITUwJmNr2YgZWphXEvmP8n0nDZ3MdnVJ3SI0HYY1rucFxLESd03gDOxiurQzj9o8lMM2Pk/fcKKt0jsRc1wxn9uqDIaSoMBmgWcxRGTDYErYmMa+u0i9PTgdpTPDf/0Be32vFR19YH8bj2AO40YmVwNodjgmJ+7vJDHyv9HVYx8C4BWfTc7vyAXPrdZLFS05xbscpUYFZuFyGC3a0kpOA0HYEmbOaqff7wD+zPPLMUiabUC8JpPNCQGqQjEQOsPJ7v2ed8gJY0TrDnW2kMWZYkTG3cj97kxl41FqOpjONnIHr8s0mOTh1MTTZiJ8xkD6twLlsDiUmvLKTn3XEU/ere+5hjc6oRgyN4TaXpaQF0ftY3m0GK05fus2JdMPl6ASoKi+miE1WF2SU=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b4a9576-140b-4316-d80c-08d753f3743f
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Oct 2019 17:48:58.7674 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZC/1A82RjZo8qPiMXy4TEZlUipqKE0Fz9k0sC9g5iM52Awezeotyhp+RYqAYfHI0QlmTrt0ZRD6hMoQ79Tz47g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB2487
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HIsOH1fYM2Yf8pIKNQDr0zIViey0LyfR0u0Efp/y5s0=;
 b=F47JRFDNo7+3w281AkiircQKnyyx+Vej3rAhEnuuLW0GEqZO/MOdC5nFp28PD2CTs176gZXZewqFiK6QWZ7c0OJ6dejxRYWoVn9p90gpKGhDjWBlF7X7N80ZQvaAyUk5Yo1k4kgs6PfEG1yPalJCP8bneZFI7UMpHw/P6W97f4U=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Kent.Russell@amd.com; 
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
Cc: "Kuehling, Felix" <Felix.Kuehling@amd.com>, "Kim,
 Jonathan" <Jonathan.Kim@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

SSB0aGluayB0aGUgZmlyc3QgdGhpbmcgdGhhdCBBbGV4IHdpbGwgc2F5IGlzICJwbGVhc2UgaW5j
bHVkZSBhIGNvbW1pdCBkZXNjcmlwdGlvbiIuIFdoeSBkaWQgeW91IHJldmVydCBpdD8gDQoNCiBL
ZW50DQoNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBhbWQtZ2Z4IDxhbWQtZ2Z4
LWJvdW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPiBPbiBCZWhhbGYgT2YgS2ltLCBKb25hdGhh
bg0KU2VudDogRnJpZGF5LCBPY3RvYmVyIDE4LCAyMDE5IDE6MzEgUE0NClRvOiBhbWQtZ2Z4QGxp
c3RzLmZyZWVkZXNrdG9wLm9yZw0KQ2M6IEt1ZWhsaW5nLCBGZWxpeCA8RmVsaXguS3VlaGxpbmdA
YW1kLmNvbT47IEtpbSwgSm9uYXRoYW4gPEpvbmF0aGFuLktpbUBhbWQuY29tPg0KU3ViamVjdDog
W1BBVENIIDEvMl0gUmV2ZXJ0ICJkcm0vYW1kZ3B1OiBmaXggY29tcGlsZXIgd2FybmluZ3MgZm9y
IGRmIHBlcmZtb25zIg0KDQpUaGlzIHJldmVydHMgY29tbWl0IDdkZDJlYjMxZmNkNTY0NTc0ZThl
ZmVhNmJmMjNjZjUwNGY5ZTJmZDcuDQoNClNpZ25lZC1vZmYtYnk6IEpvbmF0aGFuIEtpbSA8Sm9u
YXRoYW4uS2ltQGFtZC5jb20+DQotLS0NCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9kZl92
M182LmMgfCA0ICsrLS0NCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0
aW9ucygtKQ0KDQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZGZfdjNf
Ni5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZGZfdjNfNi5jDQppbmRleCBlMWNmN2U5
YzYxNmEuLmY0MDNjNjJjOTQ0ZSAxMDA2NDQNCi0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2RmX3YzXzYuYw0KKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZGZfdjNfNi5j
DQpAQCAtOTMsNyArOTMsNyBAQCBjb25zdCBzdHJ1Y3QgYXR0cmlidXRlX2dyb3VwICpkZl92M182
X2F0dHJfZ3JvdXBzW10gPSB7DQogCQlOVUxMDQogfTsNCiANCi1zdGF0aWMgaW50IGRmX3YzXzZf
c2V0X2RmX2NzdGF0ZShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwgaW50IGFsbG93KQ0KK3N0
YXRpYyBkZl92M182X3NldF9kZl9jc3RhdGUoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsIGlu
dCBhbGxvdykNCiB7DQogCWludCByID0gMDsNCiANCkBAIC01NDYsNyArNTQ2LDcgQEAgc3RhdGlj
IHZvaWQgZGZfdjNfNl9wbWNfZ2V0X2NvdW50KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LA0K
IAkJCQkgIHVpbnQ2NF90IGNvbmZpZywNCiAJCQkJICB1aW50NjRfdCAqY291bnQpDQogew0KLQl1
aW50MzJfdCBsb19iYXNlX2FkZHIsIGhpX2Jhc2VfYWRkciwgbG9fdmFsID0gMCwgaGlfdmFsID0g
MDsNCisJdWludDMyX3QgbG9fYmFzZV9hZGRyLCBoaV9iYXNlX2FkZHIsIGxvX3ZhbCwgaGlfdmFs
Ow0KIAkqY291bnQgPSAwOw0KIA0KIAlzd2l0Y2ggKGFkZXYtPmFzaWNfdHlwZSkgew0KLS0gDQoy
LjE3LjENCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18N
CmFtZC1nZnggbWFpbGluZyBsaXN0DQphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4DQpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxp
bmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
