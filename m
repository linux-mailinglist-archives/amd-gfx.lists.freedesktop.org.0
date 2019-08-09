Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FC4786F8E
	for <lists+amd-gfx@lfdr.de>; Fri,  9 Aug 2019 04:15:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9EE76ECEE;
	Fri,  9 Aug 2019 02:15:48 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680043.outbound.protection.outlook.com [40.107.68.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9B556ECEE
 for <amd-gfx@lists.freedesktop.org>; Fri,  9 Aug 2019 02:15:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jdYn6dIBSpDFGoG0HEoUOLoY+hiR1noI3KoSA1BEQln0IvIFgrxEul+16fLG7Y1iDc8KwxlFK4vgHSJWbknvvEjr0tnOH7KX9WN4qxatZkYJ0nulRntDZC43MNvHcgrxfvvW24f8EYbEH3bbv3YxlaZ7WBWGnEzXzrWGHoF1h8x34Ba3QJ5JKIbOKOHd/X02AJ0OKpkYRdmVtQF3NZIilK6mqB32VMqTOejF/wP0CzfQ6wLNLlU+HtT3O74RThfeOu3KPd29qVTBXdU1z0jXvJ7UboS7SE779Tdz97M4+PHGOaOLFTed6fHsoCr7qmvuZSDVJ4zVs5N2esPZvFTSaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lmVRnRxKgDexqSta5mt2jhX6E3AXmBYjTiYMfDA6HSc=;
 b=PNleSsF0qR31oQTYSDNi/ZiLrxwLH3W830cg2Nar65M4ycRorwkEm8/Hq9BGbblt+EnG4UDkXp1PpmLIe46980MKnh1iVDH78OzhYecM8QbD9zYP5hUQC2S5JxDRjV1W0K2bx0iWW59IQj2tCtd9ssxDbWb1WTislxdwOqcJPgZu/PdLTkHrFBswRo2p7aJIkRoANJTr5h17zHSX4AZjapKnWizetO3l8ygZwFNZggQCmSSzc7BLp6OMXQRMyW5vkujVypNppmjvks3WvwzMAxxQzNYFrrxGWX8kVIBUadI5/ElR3fBxUdhjLo8dDXD9q85YtyHEVDWHnzu4qYMN+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from BL0PR12MB2580.namprd12.prod.outlook.com (52.132.27.147) by
 BL0PR12MB2436.namprd12.prod.outlook.com (52.132.29.147) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2136.17; Fri, 9 Aug 2019 02:15:41 +0000
Received: from BL0PR12MB2580.namprd12.prod.outlook.com
 ([fe80::718c:48e0:4e04:5543]) by BL0PR12MB2580.namprd12.prod.outlook.com
 ([fe80::718c:48e0:4e04:5543%7]) with mapi id 15.20.2157.015; Fri, 9 Aug 2019
 02:15:41 +0000
From: "Zeng, Oak" <Oak.Zeng@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 4/5] drm/amdgpu: Support snooped PTE flag
Thread-Topic: [PATCH 4/5] drm/amdgpu: Support snooped PTE flag
Thread-Index: AQHVTlhXXcI9iAy5pkax2f/14M8R/Q==
Date: Fri, 9 Aug 2019 02:15:41 +0000
Message-ID: <1565316926-19516-4-git-send-email-Oak.Zeng@amd.com>
References: <1565316926-19516-1-git-send-email-Oak.Zeng@amd.com>
In-Reply-To: <1565316926-19516-1-git-send-email-Oak.Zeng@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTXPR0101CA0033.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::46) To BL0PR12MB2580.namprd12.prod.outlook.com
 (2603:10b6:207:3e::19)
x-mailer: git-send-email 2.7.4
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.55.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ccec138d-704d-4975-3f88-08d71c6f79f5
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BL0PR12MB2436; 
x-ms-traffictypediagnostic: BL0PR12MB2436:
x-microsoft-antispam-prvs: <BL0PR12MB2436D0CE022EC0CB3184AB3280D60@BL0PR12MB2436.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2089;
x-forefront-prvs: 01244308DF
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(136003)(366004)(376002)(346002)(396003)(189003)(199004)(2616005)(14454004)(5660300002)(99286004)(305945005)(316002)(7736002)(478600001)(76176011)(6116002)(36756003)(386003)(6506007)(8936002)(2351001)(6486002)(53936002)(26005)(52116002)(186003)(3846002)(6916009)(54906003)(476003)(71200400001)(71190400001)(2906002)(102836004)(81156014)(6436002)(8676002)(256004)(86362001)(25786009)(11346002)(5640700003)(486006)(66066001)(66476007)(14444005)(81166006)(66446008)(6512007)(66946007)(66556008)(64756008)(446003)(4744005)(50226002)(2501003)(4326008);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BL0PR12MB2436;
 H:BL0PR12MB2580.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: l3IcESAPTB9h4FLmWTJ/VOXgJzEunP6vbDehnRZCUHx+qPR/6CbyjRXG3JEEX7uw7lert1K5Y8IA0bRFh9on4ACeCHyIc+/0xRI6XXXlQb/tyiiyKUaCKbEPTd2tLLO+C2FGlOt19XEQaWZiWoWAYLo7YrxEIIdQYCCVEQXAN3GzpTXGCgQ1UWSDGBV8zPkCnPUyGap7jNUgfKpGqavDnjYonW5d2pJTnwnK1EDdOGGCBnovZf0PHwQTjd98jlFOLFQOPNOVCY9uaxfqF9DJVimyIzYS6ObEW0BWUsXvXaPBHwyWONg2bBuXxiWBbab0zYq/J7LjIC5xTeiy22qJJCMkmNZNv8boWDvUacKwG+5TAWKONYUE6QzzF40pW6E7c7NpliJZ4PsSFYpC+vQIOP67UWNeudovlf78/I8diLo=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ccec138d-704d-4975-3f88-08d71c6f79f5
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Aug 2019 02:15:41.1536 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ynfgFUQYokzoVV81vb20xZ6zrCF/zeEiY2Wqk/+A2GDNbMZ1qxIH4UcXZBLE41w0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2436
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lmVRnRxKgDexqSta5mt2jhX6E3AXmBYjTiYMfDA6HSc=;
 b=xsZ12PXfYIg/l31BSga5COXbDcpA5VzjnuiDHf2g8VgwrrgUzGk6+WYOr9vJTCPBjXf0N7zYQsPiX1V040I34xxyJvOB08bS6FwP44v9No0lvmWOYTVxr6Z2S3MjATgVz40ZT0CRlyDFzlAXgnDE8xUBpCwLJCo1wjHLjBZm2nc=
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
Cc: "Kuehling, Felix" <Felix.Kuehling@amd.com>, "Zeng, Oak" <Oak.Zeng@amd.com>,
 "Koenig, Christian" <Christian.Koenig@amd.com>, "Keely,
 Sean" <Sean.Keely@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

U2V0IHNub29wZWQgUFRFIGZsYWcgYWNjb3JkaW5nIHRvIG1hcHBpbmcgZmxhZy4gV3JpdGUgcmVx
dWVzdCB0byBhCnBhZ2Ugd2l0aCBzbm9vcGVkIGJpdCBzZXQsIHdpbGwgc2VuZCBvdXQgaW52YWxp
ZGF0ZSBwcm9iZSByZXF1ZXN0CnRvIFRDQyBvZiB0aGUgcmVtb3RlIEdQVSB3aGVyZSB0aGUgdnJh
bSBwYWdlIHJlc2lkZXMuCgpDaGFuZ2UtSWQ6IEk3OTlmNjhlYzdhNWExYWJmMzIwNzVmNWVmMzEw
NTE2NDFhMGIzNzM2ClNpZ25lZC1vZmYtYnk6IE9hayBaZW5nIDxPYWsuWmVuZ0BhbWQuY29tPgot
LS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dtY192OV8wLmMgfCAzICsrKwogMSBmaWxl
IGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2dtY192OV8wLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nbWNfdjlf
MC5jCmluZGV4IGQ3MDk5MDIuLjhmYWVhZDMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2dtY192OV8wLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ21j
X3Y5XzAuYwpAQCAtNTk5LDYgKzU5OSw5IEBAIHN0YXRpYyB1aW50NjRfdCBnbWNfdjlfMF9nZXRf
dm1fcHRlX2ZsYWdzKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LAogCWlmIChmbGFncyAmIEFN
REdQVV9WTV9QQUdFX1BSVCkKIAkJcHRlX2ZsYWcgfD0gQU1ER1BVX1BURV9QUlQ7CiAKKwlpZiAo
ZmxhZ3MgJiBBTURHUFVfVk1fUEFHRV9JTlZBTElEQVRFX1BST0JFKQorCQlwdGVfZmxhZyB8PSBB
TURHUFVfUFRFX1NOT09QRUQ7CisKIAlyZXR1cm4gcHRlX2ZsYWc7CiB9CiAKLS0gCjIuNy40Cgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1h
aWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
