Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FCDE6D203
	for <lists+amd-gfx@lfdr.de>; Thu, 18 Jul 2019 18:29:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A24356E43A;
	Thu, 18 Jul 2019 16:29:04 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr710058.outbound.protection.outlook.com [40.107.71.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7F3A6E43A
 for <amd-gfx@lists.freedesktop.org>; Thu, 18 Jul 2019 16:29:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E3OKcDeCUwiJxDpuB6K8etTaq97xFWQhA1OZuo9gFIrQqJmR2HR44mh9DqktnJLp9HDF7PL6x65RCfEQyZotHUG7p/nnS0CdKynTS8TbXksRkPOejMxM12lt1G8J5Rzk34p2uM3O5sebavGRwABa8iYklzT9cpQ7+JYSX758bRH3DX37tKdjc3BD4H0OlogNFVeRpSf8MxI5LGMNCmMVLr0VkRviwZ+pP+Q1JkfkHSbcGsbdOYWYb2/uE3vvkSwwL9lBVoMFshBm7wfn/8AD6L/HQ2TmPUHcpVEHvOqo+2h25stYhLwCWLO/DMctA6p/eFzyWqNWZH23ASZ2chH58w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mw1beMeer7dqaTAOmLHZlarq0EAgAV7SFaAj2qDHM20=;
 b=eNt6x+84Jq/cBn8IJOog5D8lou9Buth0BbnWqVbQ7WHU1TRcaQ758yfzyLbPmIqaOSVlkfg9FHw3eXG9fRm2Ws4aB3vZkjSW4WrlHa2EbCUxuQ2ZtSpa1/j42fmBI/qTZzAqeekTUXq3F/3oFjhD0erdl5TV+Fz4cZg441l/aeZd9oDhnQh38mDt6NPjKizStAVnjgShkNX8/An/ieNBBGnAAryS8fGBz4fqEM2PYsui3hvD0UYOic7CP4YskjWkNT6KxHCnKi6/kdCn3zLBjojU6lYTQCxkwg4M9f7BRJpRclt4r8/Xx447T92yqr+caqJMNnR6egCi/YaDSHO16g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from CY4PR12MB1302.namprd12.prod.outlook.com (10.168.164.148) by
 CY4PR12MB1734.namprd12.prod.outlook.com (10.175.62.144) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.14; Thu, 18 Jul 2019 16:29:00 +0000
Received: from CY4PR12MB1302.namprd12.prod.outlook.com
 ([fe80::c124:5267:775:e689]) by CY4PR12MB1302.namprd12.prod.outlook.com
 ([fe80::c124:5267:775:e689%4]) with mapi id 15.20.2073.012; Thu, 18 Jul 2019
 16:29:00 +0000
From: "StDenis, Tom" <Tom.StDenis@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] Collect all page_base_address bits for pte-further addresses
Thread-Topic: [PATCH] Collect all page_base_address bits for pte-further
 addresses
Thread-Index: AQHVPYXnZL3DchKFu0CrvUNfCkTdrA==
Date: Thu, 18 Jul 2019 16:29:00 +0000
Message-ID: <20190718162848.29246-1-tom.stdenis@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BN6PR17CA0055.namprd17.prod.outlook.com
 (2603:10b6:405:75::44) To CY4PR12MB1302.namprd12.prod.outlook.com
 (2603:10b6:903:38::20)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.21.0
x-originating-ip: [165.204.84.11]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5b6618fb-9130-4407-0cd3-08d70b9d09d3
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:CY4PR12MB1734; 
x-ms-traffictypediagnostic: CY4PR12MB1734:
x-microsoft-antispam-prvs: <CY4PR12MB173432E83ED78FC0C713EB4CF7C80@CY4PR12MB1734.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 01026E1310
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(396003)(136003)(39860400002)(346002)(366004)(189003)(199004)(7736002)(8676002)(52116002)(478600001)(305945005)(4326008)(68736007)(2351001)(25786009)(64756008)(66556008)(476003)(6506007)(26005)(66946007)(5660300002)(66476007)(81156014)(66446008)(102836004)(2616005)(186003)(6436002)(386003)(86362001)(4744005)(1076003)(2501003)(486006)(256004)(3846002)(6116002)(66066001)(99286004)(6512007)(81166006)(14444005)(36756003)(8936002)(53936002)(14454004)(6916009)(6486002)(2906002)(5640700003)(316002)(71200400001)(71190400001)(50226002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR12MB1734;
 H:CY4PR12MB1302.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: yE1HEK9HsGp2kLW4Con8UXjyvv10qDhSL7RllCFgip+vBuhpLWFSI1jQrgJpk5YV/XHw8zHDGL/ZO062824f1xG1fQNxsvjSEE6MW3Mst4+WV9y9aoLNyOg1IujWNOmUAEjRX3gWmelF4rndIt8etrRni7s6zyICQpQbWDBXBjS7MGttMD18GOZWZ3ypGYir3YVebFMb1neUDy/kqGfc9qrFLmYNYtGEoHNp5l0YZ9brkRQXeoiQ7Pz/uRl8liay42MZGnsn7R9QBP7cC4YLs0pDX96GtKCFRUDPkOttQPfey5gIaDiMeQHLCrOiav9lSXFYJhIwf8YcX25z8k1gofdDUbtkI2fOeMeiR+ue+czNg+xL2UUVeABSzrQhg5ycNFx26DmZ02kyaDkIcOLTIlsG1OTA/xOxUa4hdDNCsXQ=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b6618fb-9130-4407-0cd3-08d70b9d09d3
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jul 2019 16:29:00.4249 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tstdenis@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1734
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mw1beMeer7dqaTAOmLHZlarq0EAgAV7SFaAj2qDHM20=;
 b=F8lR+UBDN0h26L0JMTn24W2Jca5XDC3lJvc4hiqatbBVkHwq3zQDTqjoO9D9qyBZdGtmpseisbvULq/8eRFcomHngZXZnhZiYtXz6LCPwHd+3W+XpwDiMt59a3CCjpv8tPD5Gy+b+54LToioFa55Fw5IY3XdRHwM7RgvbfGACjY=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Tom.StDenis@amd.com; 
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
Cc: "StDenis, Tom" <Tom.StDenis@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

VGhlIHNwZWNpZmljYXRpb24gc2F5cyB0byB0cmVhdCBhIFBURSB3aXRoIHRoZSBGIGJpdCBzZXQg
Imxpa2UgYSBQREUiCndoaWNoIG1lYW5zIHRoYXQgYWxsIGJ1dCB0aGUgbG93ZXIgNiBiaXRzIGFy
ZSBwYXJ0IG9mIHRoZSBwYWdlIGJhc2UKYWRkcmVzcy4gIEluZGVlZCwgaW4gdGhlIHdpbGQgYSBj
b21tZW50IGNhbWUgYmFjayBpbmRpY2F0aW5nIHRoYXQKd2Ugd2VyZSBzdHJpcHBpbmcgb2ZmIGJp
dHMgbmVlZGVkIHRvIHByb3Blcmx5IGZldGNoIHRoZSBuZXh0ClBURS4KClNpZ25lZC1vZmYtYnk6
IFRvbSBTdCBEZW5pcyA8dG9tLnN0ZGVuaXNAYW1kLmNvbT4KLS0tCiBzcmMvbGliL3JlYWRfdnJh
bS5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0p
CgpkaWZmIC0tZ2l0IGEvc3JjL2xpYi9yZWFkX3ZyYW0uYyBiL3NyYy9saWIvcmVhZF92cmFtLmMK
aW5kZXggY2JhOGY2Yi4uMjA5Y2E4NCAxMDA2NDQKLS0tIGEvc3JjL2xpYi9yZWFkX3ZyYW0uYwor
KysgYi9zcmMvbGliL3JlYWRfdnJhbS5jCkBAIC02NTQsNyArNjU0LDcgQEAgcHRlX2Z1cnRoZXI6
CiAKIAkJCS8vIGRlY29kZSBQVEUgdmFsdWVzCiBwZGVfaXNfcHRlOgotCQkJcHRlX2ZpZWxkcy5w
YWdlX2Jhc2VfYWRkciA9IHB0ZV9lbnRyeSAmIDB4RkZGRkZGRkZGMDAwVUxMOworCQkJcHRlX2Zp
ZWxkcy5wYWdlX2Jhc2VfYWRkciA9IHB0ZV9lbnRyeSAmIDB4RkZGRkZGRkZGRkMwVUxMOyAvLyBh
bGwgYnV0IGJvdHRvbSA2IGJpdHMgYXJlIFBCQQogCQkJcHRlX2ZpZWxkcy5mcmFnbWVudCAgICAg
ICA9IChwdGVfZW50cnkgPj4gNykgICYgMHgxRjsKIAkJCXB0ZV9maWVsZHMuc3lzdGVtICAgICAg
ICAgPSAocHRlX2VudHJ5ID4+IDEpICYgMTsKIAkJCXB0ZV9maWVsZHMudmFsaWQgICAgICAgICAg
PSBwdGVfZW50cnkgJiAxOwotLSAKMi4yMS4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2FtZC1nZng=
