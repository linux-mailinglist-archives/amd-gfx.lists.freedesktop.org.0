Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 29BE1DE1CF
	for <lists+amd-gfx@lfdr.de>; Mon, 21 Oct 2019 03:43:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B773C89916;
	Mon, 21 Oct 2019 01:43:24 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr720057.outbound.protection.outlook.com [40.107.72.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 082AA89916
 for <amd-gfx@lists.freedesktop.org>; Mon, 21 Oct 2019 01:43:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i42Dc9Cn8/QTtplMF8RaLCAtMvMT0rRj0kIxl4pXCe7PizkBcxcQNBs5Yuj1+lu8FaRT5EKWVZlp1eYBbr/Br37SL7LHR1hxIWKAL2Qg47XhJsVCTl221P+8e2IiO1E5L3a1mQRvwHvHRL3FAugR+1VTTef1km/TEKICifVJGEv7gKrrbExKUE92z3rVUw/r0WrU780gvOuAAvezKRhXH/d/9+Xp3Mm8z/w4Ly+4VAJZRFmGDATCOUIjh0YICyK3qRNrC3JS2f+MfsH+ofcbEkFAkWqJI8razS0AcDrPH6+7RixjewsPb7YvFO3seGWsdrSCiwUXPTxzthwnBlqpIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rQl8lHB+NDREAHChAVDncz2BorYCUoE3RyGkwMqK+g4=;
 b=Mtzljb7ZiDlibjehHx4RSCh43SQo1DBtt1386V6u0fls/sJNfdfmcW6fMR3U1+IqO6AbsQVDW0PrcX6sDL5xu8dhhnr8WGMTHlthKXTBBSp6vl1hhv5KhVCEmS9srU6GqiTBPPr3fD3C2JU2TxnI00NpgX6W8vW8fi6X/6h5KJ9b/ec56tPMPEZ3XCTDckViZsnMBlRZfxKYqHRbZ91t9HHNhZsk3U1nBfl5YCsHinscIXgS9cp+ftTgI55z4n1dLX7Rax62s6BCZ+41WF783bRko5F0NnW7Wnmx3mCSWNqpO1g9ERKwzhLsBMvaMchMWOTyq1A8AHn3HufR/qPFPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3344.namprd12.prod.outlook.com (20.178.241.74) by
 MN2PR12MB3917.namprd12.prod.outlook.com (10.255.237.81) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.21; Mon, 21 Oct 2019 01:43:19 +0000
Received: from MN2PR12MB3344.namprd12.prod.outlook.com
 ([fe80::435:bdca:bac1:a26d]) by MN2PR12MB3344.namprd12.prod.outlook.com
 ([fe80::435:bdca:bac1:a26d%5]) with mapi id 15.20.2367.019; Mon, 21 Oct 2019
 01:43:19 +0000
From: "Quan, Evan" <Evan.Quan@amd.com>
To: "Grodzovsky, Andrey" <Andrey.Grodzovsky@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH 0/4] Add RAS EEPROM table support for Arcturus.
Thread-Topic: [PATCH 0/4] Add RAS EEPROM table support for Arcturus.
Thread-Index: AQHVhfWUyXNJPJ/ma0KglYPZAZTioadkVagA
Date: Mon, 21 Oct 2019 01:43:19 +0000
Message-ID: <MN2PR12MB3344FD780DCA649074D31ED6E4690@MN2PR12MB3344.namprd12.prod.outlook.com>
References: <1571431711-30149-1-git-send-email-andrey.grodzovsky@amd.com>
In-Reply-To: <1571431711-30149-1-git-send-email-andrey.grodzovsky@amd.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e6af5887-badd-4782-6e5b-08d755c80d21
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: MN2PR12MB3917:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB3917A4C366FB83B4C21D88A4E4690@MN2PR12MB3917.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3631;
x-forefront-prvs: 0197AFBD92
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(136003)(396003)(346002)(366004)(376002)(199004)(189003)(13464003)(33656002)(110136005)(3846002)(76176011)(8936002)(6116002)(53546011)(6506007)(76116006)(66556008)(66476007)(66946007)(102836004)(2501003)(86362001)(54906003)(316002)(7696005)(64756008)(66066001)(186003)(26005)(2906002)(66446008)(52536014)(486006)(476003)(74316002)(11346002)(71190400001)(71200400001)(478600001)(6436002)(446003)(6246003)(81156014)(7736002)(55016002)(8676002)(305945005)(4326008)(9686003)(81166006)(25786009)(5660300002)(99286004)(229853002)(256004)(14454004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3917;
 H:MN2PR12MB3344.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: WSbc0SUuVfTFd07OzDvQ5Rz1RfXxyJotxxhKjAdUgIjf1iCdxIknKGqor6BoOZ0zOwkSuOlwHmsXAXcjbFuYppcs7cFqgvMeMmomNRp6qWfrUx5ZiRVs+AuCnUJ0ExZI5rdQ09twFe/pDqL+/qoApftS01a2H294cJv2i+PMWxAUirOrI6Kvr0gtEtuManfbWth3J5lY3xnbIjhDyCzXsCC8WOXJAkU0/3/VqLi5Tg8ECxtozrHV2hacixkJjhlqvGwV4lBJ2gm7jRqOuXsdqo1SH0d1BWMU9vC1VAcyM+RF6fnSSeXxrF90SmXDvYwRQfoYhp3FEVInAtu4oa/B8ULmN5qbwmhAimQq98iRkWLEFCRLM8EfshWFn4Uj5/z7hN0rU7SAjQ51nOWfsEQ2Lqc+h27Zij93cPUadrh99eY=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e6af5887-badd-4782-6e5b-08d755c80d21
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Oct 2019 01:43:19.5710 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2ht84qdUmzX9c0Hw+XJXAIHoelNcD/peVWe6QKbk6Bs1cRWvKHEZrx5rhCAeqPYp
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3917
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rQl8lHB+NDREAHChAVDncz2BorYCUoE3RyGkwMqK+g4=;
 b=bRszmSRNNgEdl2YUVA8wywZgDq25SZxo10ABZtloRyizISv1OStSHdHAlnWGji4jNnYIF5g4vo+o1pXyLKyPpeeNN5GvjYM9hUoF2EcIe7yO0aVDEBrUmfmygDqyBiHOTcmfp6reP5UKsVF2fptzPDQoZ7kAesUpNULkK3kkhFc=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Evan.Quan@amd.com; 
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Grodzovsky,
 Andrey" <Andrey.Grodzovsky@amd.com>, "Zhou1, Tao" <Tao.Zhou1@amd.com>, "Chen,
 Guchun" <Guchun.Chen@amd.com>,
 "noreply-confluence@amd.com" <noreply-confluence@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

UGF0Y2ggMSAtIDIgYXJlIHJldmlld2VkLWJ5OiBFdmFuIFF1YW4gPGV2YW4ucXVhbkBhbWQuY29t
PgpQYXRjaCAzIC0gNCBhcmUgYWNrZWQtYnk6IEV2YW4gUXVhbiA8ZXZhbi5xdWFuQGFtZC5jb20+
CgotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQpGcm9tOiBBbmRyZXkgR3JvZHpvdnNreSA8YW5k
cmV5Lmdyb2R6b3Zza3lAYW1kLmNvbT4gClNlbnQ6IFNhdHVyZGF5LCBPY3RvYmVyIDE5LCAyMDE5
IDQ6NDggQU0KVG86IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCkNjOiBDaGVuLCBHdWNo
dW4gPEd1Y2h1bi5DaGVuQGFtZC5jb20+OyBaaG91MSwgVGFvIDxUYW8uWmhvdTFAYW1kLmNvbT47
IERldWNoZXIsIEFsZXhhbmRlciA8QWxleGFuZGVyLkRldWNoZXJAYW1kLmNvbT47IG5vcmVwbHkt
Y29uZmx1ZW5jZUBhbWQuY29tOyBRdWFuLCBFdmFuIDxFdmFuLlF1YW5AYW1kLmNvbT47IEdyb2R6
b3Zza3ksIEFuZHJleSA8QW5kcmV5Lkdyb2R6b3Zza3lAYW1kLmNvbT4KU3ViamVjdDogW1BBVENI
IDAvNF0gQWRkIFJBUyBFRVBST00gdGFibGUgc3VwcG9ydCBmb3IgQXJjdHVydXMuCgpUaGlzIHBh
dGNoIHNldCBhZGRzIHN1cHBvcnQgZm9yIEFyY3R1cnVzIEVFUFJPTSB0byBzdG9yZSBSQVMgCmVy
cm9ycyB3aGljaCByaXNlIGR1cmluZyBydW4gdGltZSBzbyBvbiBuZXh0IGRyaXZlciBsb2FkIHRo
b3NlIAplcnJvcnMgY2FuIGJlIHJldHJpZXZlZCBhbmQgYWN0aW9uIHRha2VuIG9uIHRoZW0gCihl
LmcuIFJlc2VydmUgYmFkIG1lbW9yeSBwYWdlcyB0byBkaXNhbGxvdyB0aGVpciB1c2FnZSBieSB0
aGUgR1BVKS4KClRoZSBJMkMgY29tbXVuaWNhdGlvbiBpcyBkb25lIHRocm91Z2ggU01VIHRhYmxl
ICB3aGljaCBpcyB3aGF0IGluIHBhdGNoIDIKd2hpbGUgcGF0Y2ggNCByZWxvY2F0ZXMgUkFTIHJl
Y292ZXJ5IGluaXQgdG8gbXVjaCBsYXRlciBwbGFjZSB0aGVuIGJlZm9yZQpzaW5jZSBTTVUgbXVz
dCBiZSBmdWxseSBvcGVyYXRpb25hbCBmb3IgdGhpcyB0byB3b3JrIG9uIEFyY3R1cnVzLgoKCkFu
ZHJleSBHcm9kem92c2t5ICg0KToKICBkcm0vYW1kL3Bvd2VycGxheTogQWRkIGludGVyZmFjZSBm
b3IgSTJDIHRyYW5zYWN0aW9ucyB0byBTTVUuCiAgZHJtL2FtZC9wb3dlcnBsYXk6IEFkZCBFRVBS
T00gSTJDIHJlYWQvd3JpdGUgc3VwcG9ydCB0byBBcmN0dXJ1cy4KICBkcm0vYW1kZ3B1OiBVc2Ug
QVJDVFVSVVMgaW4gUkFTIEVFUFJPTS4KICBkcm0vYW1kZ3B1OiBNb3ZlIGFtZGdwdV9yYXNfcmVj
b3ZlcnlfaW5pdCB0byBhZnRlciBTTVUgcmVhZHkuCgogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvYW1kZ3B1X2RldmljZS5jICAgICB8ICAxMyArKwogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvYW1kZ3B1X3Jhc19lZXByb20uYyB8ICAgOSArLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvYW1kZ3B1X3R0bS5jICAgICAgICB8ICAxMSAtLQogZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dl
cnBsYXkvYXJjdHVydXNfcHB0LmMgICB8IDIyOSArKysrKysrKysrKysrKysrKysrKysrKysrCiBk
cml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9pbmMvYW1kZ3B1X3NtdS5oIHwgICA5ICsKIDUg
ZmlsZXMgY2hhbmdlZCwgMjU5IGluc2VydGlvbnMoKyksIDEyIGRlbGV0aW9ucygtKQoKLS0gCjIu
Ny40CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQt
Z2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
