Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D03F724BA
	for <lists+amd-gfx@lfdr.de>; Wed, 24 Jul 2019 04:34:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C06EA6E425;
	Wed, 24 Jul 2019 02:34:27 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam04on061c.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe4d::61c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B4D28961E
 for <amd-gfx@lists.freedesktop.org>; Wed, 24 Jul 2019 02:34:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ka4orHd4vLsEmTRnRVlDRj9zaBoTVOwKez1LAO/DyZrnHa16Uw3ueMAK50CYslzi5YPKIJHVjqD43HZ4BUflEI9huMUXkVpsK3aLhPgpaqpP6ttn/E/qStIDMWYU6HEl0oxtPyBK0fVeUCl2/sxOa4VLC8+5Rm8Lnlgl6gWDF4jJ7+PGazDNJTtbXymeOZsixUDPVGFNJswNZvQeDyFdVP1MKhu8p8arNjhfOnriujVEkohRmP6oE77gXLGraMNzRUu9WeoVT9mILBT9zPCiOs6i3Rb4qAGBiYbhqVQ6XgruL+1G/psxtxhm5VY5OhWDEvfkSL2uDbvftRyoUrFINw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1u6d7U/x+kV5fXjz/8it+74w5IAZMWWkFqc2JKfYo/w=;
 b=DmyPO8hoUTvwvcGxBcW3KQJvGrXbeRfVH/H3LoEnjptxPAGPEQwnjBELA0Nuq0spKx/nAfGnVUabczHQQ8AcqQo5FLsWH7qbB+4Pop1gggwIlQlmXEKbYRICqlWI3LfL10eWdMNQMgxIyXo5wvf24uOwC3l0l26eOLN5Ow/JYHGtuDFkhpz1/kJ/q3VGWhip435Lq5bWzGdJ/z4ScrbaXdDNvk/TWn4Th1AOiQpZ9f7itnemEpyUK1aVA3kAp1TEDkjeJE0sHU66qaRSXEvvhGyFYu+Y1LkLhqdZsz5HPHh5gcPtEexnO4RFST+Lhy25i5Z7bUvC5iI7H905OcFfPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from MN2PR12MB3598.namprd12.prod.outlook.com (20.178.244.84) by
 MN2PR12MB3551.namprd12.prod.outlook.com (20.179.83.30) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.17; Wed, 24 Jul 2019 02:34:23 +0000
Received: from MN2PR12MB3598.namprd12.prod.outlook.com
 ([fe80::40cc:2c68:41f3:c5b5]) by MN2PR12MB3598.namprd12.prod.outlook.com
 ([fe80::40cc:2c68:41f3:c5b5%7]) with mapi id 15.20.2094.017; Wed, 24 Jul 2019
 02:34:23 +0000
From: "Feng, Kenneth" <Kenneth.Feng@amd.com>
To: "Wang, Kevin(Yang)" <Kevin1.Wang@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH] drm/amd/powerplay: fix temperature granularity error in
 smu11
Thread-Topic: [PATCH] drm/amd/powerplay: fix temperature granularity error in
 smu11
Thread-Index: AQHVQU9OHIipvp+bC0yHsFNY2j2yu6bZDd+Q
Date: Wed, 24 Jul 2019 02:34:23 +0000
Message-ID: <MN2PR12MB359893A71D8F363573FF4C938EC60@MN2PR12MB3598.namprd12.prod.outlook.com>
References: <20190723120756.27823-1-kevin1.wang@amd.com>
In-Reply-To: <20190723120756.27823-1-kevin1.wang@amd.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5944ecb8-776b-4608-fd7d-08d70fdf70b1
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3551; 
x-ms-traffictypediagnostic: MN2PR12MB3551:
x-microsoft-antispam-prvs: <MN2PR12MB35518E9841C1FE3B420A07608EC60@MN2PR12MB3551.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3826;
x-forefront-prvs: 0108A997B2
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(39860400002)(136003)(366004)(376002)(346002)(199004)(189003)(13464003)(2501003)(86362001)(5660300002)(25786009)(316002)(54906003)(52536014)(110136005)(68736007)(478600001)(8936002)(81166006)(81156014)(8676002)(76176011)(7696005)(14454004)(66066001)(76116006)(33656002)(99286004)(66946007)(66446008)(64756008)(66556008)(66476007)(102836004)(53936002)(26005)(2906002)(6436002)(6506007)(53546011)(305945005)(7736002)(186003)(6246003)(74316002)(71200400001)(71190400001)(55016002)(229853002)(256004)(9686003)(486006)(11346002)(476003)(4326008)(6116002)(3846002)(446003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3551;
 H:MN2PR12MB3598.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 8fkoFHSYGgRBGZYa0GunxEcYNjViG2zdOhxIYmVLS6Fpsd6deptsgT5vqNMzFAhzEGIaCJ7RSXyDH03uuN03R4HMzZsL/3kS1CdbiWwO6WDdbXqXr1dO65k9FBPxYPhQSf9SrfM/GDrZ5XxfL9dpCdkUJ984fp6MixjDa2Qq60/ffMPdTM5hziRWbMNhJemCfr7dEQH5rYPiGXjLglLZ/ACY5QfoUMYvkLHlZxhHwA9y0cK7+1GemIDNjJkPzM8Dn7MY03rJd134EdlKCtdSMXqUzgZ8SZZGumpmTIDuhfVkbl5U+xy0xXLwMH9aqDmJ13tHhVX5bxGG++wTtIFWK6tug34ZwQ/sMUpcf4bqRp5dvnX12+bTlMCHeOCO68Zu1SneQA/Qyp49YVjRdV+YPRbwbur27aboCpDNenoUfUY=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5944ecb8-776b-4608-fd7d-08d70fdf70b1
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jul 2019 02:34:23.7771 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qyfeng@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3551
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1u6d7U/x+kV5fXjz/8it+74w5IAZMWWkFqc2JKfYo/w=;
 b=1vZmPRBiCTHVKSGM8iSuqM/1t5Is9ZFYorQhvW6ywdwv8fy/1uzw7fFZE6KQYgVRahSa0VHmFAh1+7NnZ21a0ZStjr8OY/ntyzZeb4q1mO3po/8n58oDj8g767m4F2zKn6x35wMPvwlkSynVjxEDDTpvzFmpaPZ2VYNau89Okrw=
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
Cc: "Huang, Ray" <Ray.Huang@amd.com>, "Quan, Evan" <Evan.Quan@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

UmV2aWV3ZWQtYnk6IEtlbm5ldGggRmVuZyA8a2VubmV0aC5mZW5nQGFtZC5jb20+CgoKLS0tLS1P
cmlnaW5hbCBNZXNzYWdlLS0tLS0KRnJvbTogV2FuZywgS2V2aW4oWWFuZykgClNlbnQ6IFR1ZXNk
YXksIEp1bHkgMjMsIDIwMTkgODowOCBQTQpUbzogYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKQ2M6IEZlbmcsIEtlbm5ldGggPEtlbm5ldGguRmVuZ0BhbWQuY29tPjsgSHVhbmcsIFJheSA8
UmF5Lkh1YW5nQGFtZC5jb20+OyBRdWFuLCBFdmFuIDxFdmFuLlF1YW5AYW1kLmNvbT47IFdhbmcs
IEtldmluKFlhbmcpIDxLZXZpbjEuV2FuZ0BhbWQuY29tPgpTdWJqZWN0OiBbUEFUQ0hdIGRybS9h
bWQvcG93ZXJwbGF5OiBmaXggdGVtcGVyYXR1cmUgZ3JhbnVsYXJpdHkgZXJyb3IgaW4gc211MTEK
CmluIHRoaXMgcGF0Y2gsCmRybS9hbWQvcG93ZXJwbGF5OiBhZGQgY2FsbGJhY2sgZnVuY3Rpb24g
b2YgZ2V0X3RoZXJtYWxfdGVtcGVyYXR1cmVfcmFuZ2UgdGhlIGRyaXZlciBtaXNzZWQgdGVtcGVy
YXR1cmUgZ3JhbnVsYXJpdHkgY2hhbmdlIG9uIG90aGVyIHRlbXBlcmF0dXJlLgoKU2lnbmVkLW9m
Zi1ieTogS2V2aW4gV2FuZyA8a2V2aW4xLndhbmdAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9k
cm0vYW1kL3Bvd2VycGxheS9zbXVfdjExXzAuYyB8IDE4ICsrKysrKysrKy0tLS0tLS0tLQogMSBm
aWxlIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKSwgOSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9zbXVfdjExXzAuYyBiL2RyaXZlcnMvZ3B1
L2RybS9hbWQvcG93ZXJwbGF5L3NtdV92MTFfMC5jCmluZGV4IDc0NWIzNWExNjAwZC4uNzM1ODAy
YmIwN2I5IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9zbXVfdjEx
XzAuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9zbXVfdjExXzAuYwpAQCAt
MTIyOSwxNSArMTIyOSwxNSBAQCBzdGF0aWMgaW50IHNtdV92MTFfMF9zdGFydF90aGVybWFsX2Nv
bnRyb2woc3RydWN0IHNtdV9jb250ZXh0ICpzbXUpCiAJCQlyZXR1cm4gcmV0OwogCX0KIAotCWFk
ZXYtPnBtLmRwbS50aGVybWFsLm1pbl90ZW1wID0gcmFuZ2UubWluOwotCWFkZXYtPnBtLmRwbS50
aGVybWFsLm1heF90ZW1wID0gcmFuZ2UubWF4OwotCWFkZXYtPnBtLmRwbS50aGVybWFsLm1heF9l
ZGdlX2VtZXJnZW5jeV90ZW1wID0gcmFuZ2UuZWRnZV9lbWVyZ2VuY3lfbWF4OwotCWFkZXYtPnBt
LmRwbS50aGVybWFsLm1pbl9ob3RzcG90X3RlbXAgPSByYW5nZS5ob3RzcG90X21pbjsKLQlhZGV2
LT5wbS5kcG0udGhlcm1hbC5tYXhfaG90c3BvdF9jcml0X3RlbXAgPSByYW5nZS5ob3RzcG90X2Ny
aXRfbWF4OwotCWFkZXYtPnBtLmRwbS50aGVybWFsLm1heF9ob3RzcG90X2VtZXJnZW5jeV90ZW1w
ID0gcmFuZ2UuaG90c3BvdF9lbWVyZ2VuY3lfbWF4OwotCWFkZXYtPnBtLmRwbS50aGVybWFsLm1p
bl9tZW1fdGVtcCA9IHJhbmdlLm1lbV9taW47Ci0JYWRldi0+cG0uZHBtLnRoZXJtYWwubWF4X21l
bV9jcml0X3RlbXAgPSByYW5nZS5tZW1fY3JpdF9tYXg7Ci0JYWRldi0+cG0uZHBtLnRoZXJtYWwu
bWF4X21lbV9lbWVyZ2VuY3lfdGVtcCA9IHJhbmdlLm1lbV9lbWVyZ2VuY3lfbWF4OworCWFkZXYt
PnBtLmRwbS50aGVybWFsLm1pbl90ZW1wID0gcmFuZ2UubWluICogU01VX1RFTVBFUkFUVVJFX1VO
SVRTX1BFUl9DRU5USUdSQURFUzsKKwlhZGV2LT5wbS5kcG0udGhlcm1hbC5tYXhfdGVtcCA9IHJh
bmdlLm1heCAqIFNNVV9URU1QRVJBVFVSRV9VTklUU19QRVJfQ0VOVElHUkFERVM7CisJYWRldi0+
cG0uZHBtLnRoZXJtYWwubWF4X2VkZ2VfZW1lcmdlbmN5X3RlbXAgPSByYW5nZS5lZGdlX2VtZXJn
ZW5jeV9tYXggKiBTTVVfVEVNUEVSQVRVUkVfVU5JVFNfUEVSX0NFTlRJR1JBREVTOworCWFkZXYt
PnBtLmRwbS50aGVybWFsLm1pbl9ob3RzcG90X3RlbXAgPSByYW5nZS5ob3RzcG90X21pbiAqIFNN
VV9URU1QRVJBVFVSRV9VTklUU19QRVJfQ0VOVElHUkFERVM7CisJYWRldi0+cG0uZHBtLnRoZXJt
YWwubWF4X2hvdHNwb3RfY3JpdF90ZW1wID0gcmFuZ2UuaG90c3BvdF9jcml0X21heCAqIFNNVV9U
RU1QRVJBVFVSRV9VTklUU19QRVJfQ0VOVElHUkFERVM7CisJYWRldi0+cG0uZHBtLnRoZXJtYWwu
bWF4X2hvdHNwb3RfZW1lcmdlbmN5X3RlbXAgPSByYW5nZS5ob3RzcG90X2VtZXJnZW5jeV9tYXgg
KiBTTVVfVEVNUEVSQVRVUkVfVU5JVFNfUEVSX0NFTlRJR1JBREVTOworCWFkZXYtPnBtLmRwbS50
aGVybWFsLm1pbl9tZW1fdGVtcCA9IHJhbmdlLm1lbV9taW4gKiBTTVVfVEVNUEVSQVRVUkVfVU5J
VFNfUEVSX0NFTlRJR1JBREVTOworCWFkZXYtPnBtLmRwbS50aGVybWFsLm1heF9tZW1fY3JpdF90
ZW1wID0gcmFuZ2UubWVtX2NyaXRfbWF4ICogU01VX1RFTVBFUkFUVVJFX1VOSVRTX1BFUl9DRU5U
SUdSQURFUzsKKwlhZGV2LT5wbS5kcG0udGhlcm1hbC5tYXhfbWVtX2VtZXJnZW5jeV90ZW1wID0g
cmFuZ2UubWVtX2VtZXJnZW5jeV9tYXggCisqIFNNVV9URU1QRVJBVFVSRV9VTklUU19QRVJfQ0VO
VElHUkFERVM7CiAJYWRldi0+cG0uZHBtLnRoZXJtYWwubWluX3RlbXAgPSByYW5nZS5taW4gKiBT
TVVfVEVNUEVSQVRVUkVfVU5JVFNfUEVSX0NFTlRJR1JBREVTOwogCWFkZXYtPnBtLmRwbS50aGVy
bWFsLm1heF90ZW1wID0gcmFuZ2UubWF4ICogU01VX1RFTVBFUkFUVVJFX1VOSVRTX1BFUl9DRU5U
SUdSQURFUzsKIAotLQoyLjIyLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1k
LWdmeA==
