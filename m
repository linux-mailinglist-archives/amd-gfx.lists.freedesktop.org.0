Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DD4FB3FC0
	for <lists+amd-gfx@lfdr.de>; Mon, 16 Sep 2019 19:49:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81A896EA16;
	Mon, 16 Sep 2019 17:49:26 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70051.outbound.protection.outlook.com [40.107.7.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC70D6E9FE;
 Mon, 16 Sep 2019 16:24:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J0McmCB3gO+7ZJESTvSQmoa6mJJfRbRlvVYJ1IqPoITd98f56B74fBo0z/v2M+1h8N1MmIBAqxrz9lg7T/REh1SUb9DEuJRoR7ociJ0xIJyCVZdbiHt5OSSDEPXvPcoBHdj7zU99c4yqHHGApcahUxuSLd7L/A9RyAXdFiuKrwRVUzoiqHFefzrPdLe5FZjh/M40Y/LLglsPRfx/7muFyfhkoPXm8rnAlWZotio2PInHU3iQTBeorF6pYCNWJbYt9oZbJ6PZ+TiWz1VKs9b3J82m3j4m8jN3rgaLqyz3satI7AIWiBJl1TTJFxyhrbmwqOnSjmEMD/FSsK1r8LIA3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mra2zlzs/heW1ELKiU2g7XHRCZxy+2e6HZ9UAdB6Ojo=;
 b=bJ0Bbo3rH9XUGVsF2vbFme5UG82RWOpqf0icJNQTG/Vi1qd8Q4RllvP9CiYmTa4bpnsPRqnFhtRvs2GJ04AeWuNMH+Aax6b1KkiOLmRHBmm7ljjImzLVKtmeQ/MV8AEqNnKpiQGnEmsB7OaIuxK6t5hV5PqbV6JPJ/ng78khFH595rgRXQhoFT/f49fGct3KU26f4NeM4tniCnO+dnU87lh93gRUCOk2npeURu82QQEWBsoeXx8LF+a8V55/5V4iSRJeDNGz3IzUu4vFdnH6fLF9q0+VvVA7Pntrde27BN3HqPxfBNwJov5qA/hhx1Ulx3WwD57IikkHxZjuFq65Yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mellanox.com; dmarc=pass action=none header.from=mellanox.com;
 dkim=pass header.d=mellanox.com; arc=none
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com (10.171.182.144) by
 VI1PR05MB4496.eurprd05.prod.outlook.com (52.133.13.151) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2263.17; Mon, 16 Sep 2019 16:23:57 +0000
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::79a3:d971:d1f3:ab6f]) by VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::79a3:d971:d1f3:ab6f%7]) with mapi id 15.20.2263.023; Mon, 16 Sep 2019
 16:23:57 +0000
From: Jason Gunthorpe <jgg@mellanox.com>
To: Linus Torvalds <torvalds@linux-foundation.org>, Andrew Morton
 <akpm@linux-foundation.org>
Subject: [GIT PULL] Please pull hmm related changes
Thread-Topic: [GIT PULL] Please pull hmm related changes
Thread-Index: AQHVbKsjN/PXebQ63kaCViDhGHd0lg==
Date: Mon, 16 Sep 2019 16:23:57 +0000
Message-ID: <20190916162350.GA19191@ziepe.ca>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: QB1PR01CA0003.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c00:2d::16) To VI1PR05MB4141.eurprd05.prod.outlook.com
 (2603:10a6:803:4d::16)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [142.167.223.10]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f2cd0235-7630-4e04-0ed4-08d73ac24624
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:VI1PR05MB4496; 
x-ms-traffictypediagnostic: VI1PR05MB4496:
x-microsoft-antispam-prvs: <VI1PR05MB449638F8F2447FF36D22AD56CF8C0@VI1PR05MB4496.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-forefront-prvs: 0162ACCC24
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(376002)(396003)(39860400002)(346002)(366004)(199004)(189003)(52116002)(7736002)(81166006)(86362001)(71200400001)(71190400001)(2906002)(6116002)(3846002)(110136005)(54906003)(316002)(305945005)(25786009)(5660300002)(4326008)(33656002)(102836004)(6506007)(386003)(476003)(486006)(9686003)(8936002)(81156014)(8676002)(36756003)(66446008)(64756008)(66556008)(66476007)(66946007)(1076003)(5024004)(53936002)(14454004)(14444005)(256004)(7416002)(186003)(478600001)(66066001)(6512007)(6486002)(99286004)(6436002)(26005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR05MB4496;
 H:VI1PR05MB4141.eurprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: mellanox.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: +LtQHcOhJbmRypSVK6lt/VPfss4uM9gtTDV/ayUOydCzNtOrDpWUgreOJIodZ59zCOC0TEFHeu7p/rZ44SNESlkWNxfzrvZjQxO+XX9XPJAwx8Ea7xZIjIJorRnK+FF17Ck62nRyygzN1Q4xOTKiN5ZiocJzugzBQigiBCQVrTrQ4wVGqmzE7shEXuo/mSkaF9uphKe2tLT1vU9mSxl6l9dCPzDcO5qrsfOHufIASE4xeAwum6k51fjoGRZxINbmho4RRFz1+r43zHAIj7FzWbxpX64dLrYyo847lWX2Wx52Ywy7CKBekBcYUcW6UVBf0wfH/6WY6b+tTN75xqr67Sy7mDJ+kU/ER7piNANvuUgRN5qKLU5C8bza0DwqlvkRN9thndTk6Iqlufx1gt+jvf9gLVaKO5SCPkHFDn/zfIU=
x-ms-exchange-transport-forked: True
Content-ID: <F2BA21788EEDCB45B74193F50B0DE9A2@eurprd05.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f2cd0235-7630-4e04-0ed4-08d73ac24624
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Sep 2019 16:23:57.5016 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2KldOtnUavX8TsZ2/zkt+utWm0ywZ5E4Pub4xkKZ0DN42L73Y+DYxHWW56uXEAo1CLhwp+XaYLj4383zNOH8wA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR05MB4496
X-Mailman-Approved-At: Mon, 16 Sep 2019 17:49:26 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Mellanox.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mra2zlzs/heW1ELKiU2g7XHRCZxy+2e6HZ9UAdB6Ojo=;
 b=omM7d9MT7ocCjQiu9RVzbQDhH0KbZxsox6N1CwQ6gRsd6wJb1xn8eYny3WSHdVB4zO6TNORa8tZZMVwoR/V++MUcMEKUuqZpS8Waa0nLqKu5mR8X9OFQ6FbPwSe5BT3TNbIvsBdmhBbal73iiYmeQ8oHVTjSUPUIuTlaAIaKq3Y=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=jgg@mellanox.com; 
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
Cc: Dimitri Sivanich <sivanich@hpe.com>, David Airlie <airlied@linux.ie>,
 "Kuehling, Felix" <Felix.Kuehling@amd.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Christoph Hellwig <hch@lst.de>, "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 Daniel Vetter <daniel@ffwll.ch>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Dan Williams <dan.j.williams@intel.com>,
 "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

SGkgTGludXMsCgpDb250aW51aW5nIG9uIHRoZSBjbGVhbnVwIHRoZW1lIGZyb20gbGFzdCBtZXJn
ZSB3aW5kb3csIGhlcmUgaXMKYW5vdGhlciBzZXQgb2YgaG1tIGFuZCBjbG9zZWx5IHJlbGF0ZWQg
cGF0Y2hlcyB0aGF0IGFyZSBsYXJnZWx5CmNsZWFudXBzIGFuZCBidWcgZml4ZXMgd2l0aG91dCBh
bnkgcGFydGljdWxhcmx5IG5vdGFibGUgZnVuY3Rpb25hbApjaGFuZ2UuCgpUaGUgZGlmZnN0YXQg
YmVsb3cgY292ZXJzIGEgd2lkZSBzZWN0aW9uIG9mIHRoZSBrZXJuZWwsIGJ1dCBhIGxvdCBvZgp0
aGlzIGlzIGNhdXNlZCBieSBDaHJpc3RvcGgncyBzZXJpZXMgdG8gcmV2aXNlIHRoZSBwYWdlIHdh
bGtlcgpBUEkuIEFmdGVyIGRpc2N1c3Npb24gd2Ugb3B0ZWQgdG8gcHV0IHRoYXQgc2VyaWVzIGlu
dG8gdGhpcyB0cmVlIHRvCmF2b2lkIGNvbmZsaWN0cy9ldGMuCgpPdGhlcndpc2UgdGhpcyBpcyBh
IHBsZWFzYW50IHJlZHVjdGlvbiBpbiBMT0MuCgpBbHRob3VnaCB3ZSBjb250aW51ZSB0byB0cnkg
dG8gZ2V0IHJldmlld3MsIHdlIG9uY2UgYWdhaW4gaGF2ZSBub3QgZ290CnRvbyBtYW55IEFja3Mg
ZnJvbSBjb3JlIG1tIHBlb3BsZS4gSG93ZXZlciB0aGUgdXNlcnMgb2YgdGhlc2UgQVBJcwpoYXZl
IGFnYWluIGNvbnRyaWJ1dGVkIGEgZmFpciBudW1iZXIgb2YgYWNrcywgcmV2aWV3cyBhbmQgdGVz
dHMuCgpJIGFtIGF3YXJlIG9mIG5vIGNvbmZsaWN0cyB0aGlzIGN5Y2xlLCBob3dldmVyIEFuZHJl
dyBoYXMgc2V2ZXJhbApzbWFsbGVyIHBhdGNoZXMgcXVldWVkIHdhaXRpbmcgb24gY2hhbmdlcyBp
biBoZXJlLgoKSW5jbHVkZWQgaXMgYSBicmFuY2ggc2hhcmVkIHdpdGggcmRtYS5naXQgZml4aW5n
IHVwIE9EUCBlbm91Z2ggdG8KYWxsb3cgdGhlIGdldC9wdXQgdHJhbnNmb3JtYXRpb24uCgpGb3Ig
bmV4dCBtZXJnZSB3aW5kb3cgSSBhbHJlYWR5IHNlZSB0aGVyZSBhcmUgcGF0Y2hlcyBwb3N0ZWQg
dG8gYWRkIGEKdGVzdCBzdWl0ZSBmb3IgaG1tX3JhbmdlX2ZhdWx0KCkgYW5kIGZpeCBidWdzLCBJ
IGFtIHdvcmtpbmcgb24gYQpzZXJpZXMgdG8gaGFybW9uaXplIHRoZSBtbXUgbm90aWZpZXIgJiBp
bnRlcnZhbCB0cmVlIHBhdHRlcm4sIGFuZCBhbHNvCnRvIGdldCBPRFAgdXNpbmcgaG1tX3Jhbmdl
X2ZhdWx0KCkuIEkgdGhpbmsgd2Ugd2lsbCBuZWVkIHRvIGRvIHRoaXMKdHJlZSBhdCBsZWFzdCBv
bmUgbW9yZSB0aW1lLgoKVGhhbmtzLApKYXNvbgoKVGhlIGZvbGxvd2luZyBjaGFuZ2VzIHNpbmNl
IGNvbW1pdCAyN2I3ZmIxYWI3YmZhZDQ1ZjU3MDJmZjBjNzhhNDgyMmE0MWIxNDU2OgoKICBSRE1B
L21seDU6IEZpeCBNUiBucGFnZXMgY2FsY3VsYXRpb24gZm9yIElCX0FDQ0VTU19IVUdFVExCICgy
MDE5LTA4LTIwIDEzOjQ0OjQzIC0wNDAwKQoKYXJlIGF2YWlsYWJsZSBpbiB0aGUgR2l0IHJlcG9z
aXRvcnkgYXQ6CgogIGdpdDovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dp
dC9yZG1hL3JkbWEuZ2l0IHRhZ3MvZm9yLWxpbnVzLWhtbQoKZm9yIHlvdSB0byBmZXRjaCBjaGFu
Z2VzIHVwIHRvIDYyOTc0ZmMzODliMzY0ZDhhZjcwZTA0NDgzNjM2MjIyMmJkM2FlNTM6CgogIGxp
Ym52ZGltbTogRW5hYmxlIHVuaXQgdGVzdCBpbmZyYXN0cnVjdHVyZSBjb21waWxlIGNoZWNrcyAo
MjAxOS0wOS0wNyAwNDoyODowNSAtMDMwMCkKCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KaG1tIHJlbGF0ZWQgcGF0Y2hlcyBm
b3IgNS40CgpUaGlzIGlzIG1vcmUgY2xlYW51cCBhbmQgY29uc29saWRhdGlvbiBvZiB0aGUgaG1t
IEFQSXMgYW5kIHRoZSB2ZXJ5CnN0cm9uZ2x5IHJlbGF0ZWQgbW11X25vdGlmaWVyIGludGVyZmFj
ZXMuIE1hbnkgcGxhY2VzIGFjcm9zcyB0aGUgdHJlZQp1c2luZyB0aGVzZSBpbnRlcmZhY2VzIGFy
ZSB0b3VjaGVkIGluIHRoZSBwcm9jZXNzLiBCZXlvbmQgdGhhdCBhIGNsZWFudXAKdG8gdGhlIHBh
Z2Ugd2Fsa2VyIEFQSSBhbmQgYSBmZXcgbWVtcmVtYXAgcmVsYXRlZCBjaGFuZ2VzIHJvdW5kIG91
dCB0aGUKc2VyaWVzOgoKLSBHZW5lcmFsIGltcHJvdmVtZW50IG9mIGhtbV9yYW5nZV9mYXVsdCgp
IGFuZCByZWxhdGVkIEFQSXMsIG1vcmUKICBkb2N1bWVudGF0aW9uLCBidWcgZml4ZXMgZnJvbSB0
ZXN0aW5nLCBBUEkgc2ltcGxpZmljYXRpb24gJgogIGNvbnNvbGlkYXRpb24sIGFuZCB1bnVzZWQg
QVBJIHJlbW92YWwKCi0gU2ltcGxpZnkgdGhlIGhtbSByZWxhdGVkIGtjb25maWdzIHRvIEhNTV9N
SVJST1IgYW5kIERFVklDRV9QUklWQVRFLCBhbmQKICBtYWtlIHRoZW0gaW50ZXJuYWwga2NvbmZp
ZyBzZWxlY3RzCgotIEhvaXN0IGEgbG90IG9mIGNvZGUgcmVsYXRlZCB0byBtbXUgbm90aWZpZXIg
YXR0YWNobWVudCBvdXQgb2YgZHJpdmVycyBieQogIHVzaW5nIGEgcmVmY291bnQgZ2V0L3B1dCBh
dHRhY2htZW50IGlkaW9tIGFuZCByZW1vdmUgdGhlIGNvbnZvbHV0ZWQKICBtbXVfbm90aWZpZXJf
dW5yZWdpc3Rlcl9ub19yZWxlYXNlKCkgYW5kIHJlbGF0ZWQgQVBJcy4KCi0gR2VuZXJhbCBBUEkg
aW1wcm92ZW1lbnQgZm9yIHRoZSBtaWdyYXRlX3ZtYSBBUEkgYW5kIHJldmlzaW9uIG9mIGl0cyBv
bmx5CiAgdXNlciBpbiBub3V2ZWF1CgotIEFubm90YXRlIG1tdV9ub3RpZmllcnMgd2l0aCBsb2Nr
ZGVwIGFuZCBzbGVlcGluZyByZWdpb24gZGVidWdnaW5nCgpUd28gc2VyaWVzIHVucmVsYXRlZCB0
byBITU0gb3IgbW11X25vdGlmaWVycyBjYW1lIGFsb25nIGR1ZSB0bwpkZXBlbmRlbmNpZXM6Cgot
IEFsbG93IHBhZ2VtYXAncyBtZW1yZW1hcF9wYWdlcyBmYW1pbHkgb2YgQVBJcyB0byB3b3JrIHdp
dGhvdXQgcHJvdmlkaW5nCiAgYSBzdHJ1Y3QgZGV2aWNlCgotIE1ha2Ugd2Fsa19wYWdlX3Jhbmdl
KCkgYW5kIHJlbGF0ZWQgdXNlIGEgY29uc3RhbnQgc3RydWN0dXJlIGZvciBmdW5jdGlvbgogIHBv
aW50ZXJzCgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tCkNocmlzdG9waCBIZWxsd2lnICgzNSk6CiAgICAgIG5vdXZlYXU6IHJl
dHVybiAtRUJVU1kgd2hlbiBobW1fcmFuZ2Vfd2FpdF91bnRpbF92YWxpZCBmYWlscwogICAgICBt
bS9obW06IHJlbW92ZSB0aGUgbGVnYWN5IGhtbV9wZm5fKiBBUElzCiAgICAgIG1tL2htbTogcmVw
bGFjZSB0aGUgYmxvY2sgYXJndW1lbnQgdG8gaG1tX3JhbmdlX2ZhdWx0IHdpdGggYSBmbGFncyB2
YWx1ZQogICAgICBtbS9obW06IG1lcmdlIGhtbV9yYW5nZV9zbmFwc2hvdCBpbnRvIGhtbV9yYW5n
ZV9mYXVsdAogICAgICBhbWRncHU6IHJlbW92ZSAtRUFHQUlOIGhhbmRsaW5nIGZvciBobW1fcmFu
Z2VfZmF1bHQKICAgICAgYW1kZ3B1OiBkb24ndCBpbml0aWFsaXplIHJhbmdlLT5saXN0IGluIGFt
ZGdwdV9obW1faW5pdF9yYW5nZQogICAgICBub3V2ZWF1OiBwYXNzIHN0cnVjdCBub3V2ZWF1X3N2
bW0gdG8gbm91dmVhdV9yYW5nZV9mYXVsdAogICAgICBtbS9obW06IHJlbW92ZSB0aGUgdW51c2Vk
IHZtYSBhcmd1bWVudCB0byBobW1fcmFuZ2VfZG1hX3VubWFwCiAgICAgIG1tL2htbTogcmVtb3Zl
IHN1cGVyZmx1b3VzIGFyZ3VtZW50cyBmcm9tIGhtbV9yYW5nZV9yZWdpc3RlcgogICAgICBtbS9o
bW06IHJlbW92ZSB0aGUgcGFnZV9zaGlmdCBtZW1iZXIgZnJvbSBzdHJ1Y3QgaG1tX3JhbmdlCiAg
ICAgIG1tL2htbTogcmVtb3ZlIHRoZSBtYXNrIHZhcmlhYmxlIGluIGhtbV92bWFfd2Fsa19odWdl
dGxiX2VudHJ5CiAgICAgIG1tL2htbTogZG9uJ3QgYWJ1c2UgcHRlX2luZGV4KCkgaW4gaG1tX3Zt
YV9oYW5kbGVfcG1kCiAgICAgIG1tL2htbTogb25seSBkZWZpbmUgaG1tX3ZtYV93YWxrX3B1ZCBp
ZiBuZWVkZWQKICAgICAgbW0vaG1tOiBjbGVhbnVwIHRoZSBobW1fdm1hX2hhbmRsZV9wbWQgc3R1
YgogICAgICBtbS9obW06IGNsZWFudXAgdGhlIGhtbV92bWFfd2Fsa19odWdldGxiX2VudHJ5IHN0
dWIKICAgICAgbW0vaG1tOiBhbGxvdyBITU1fTUlSUk9SIG9uIGFsbCBhcmNoaXRlY3R1cmVzIHdp
dGggTU1VCiAgICAgIG1tL2htbTogbWFrZSBITU1fTUlSUk9SIGFuIGltcGxpY2l0IG9wdGlvbgog
ICAgICBtbTogdHVybiBtaWdyYXRlX3ZtYSB1cHNpZGUgZG93bgogICAgICBub3V2ZWF1OiByZXNl
dCBkbWFfbnIgaW4gbm91dmVhdV9kbWVtX21pZ3JhdGVfYWxsb2NfYW5kX2NvcHkKICAgICAgbm91
dmVhdTogZmFjdG9yIG91dCBkZXZpY2UgbWVtb3J5IGFkZHJlc3MgY2FsY3VsYXRpb24KICAgICAg
bm91dmVhdTogZmFjdG9yIG91dCBkbWVtIGZlbmNlIGNvbXBsZXRpb24KICAgICAgbm91dmVhdTog
cmVtb3ZlIGEgZmV3IGZ1bmN0aW9uIHN0dWJzCiAgICAgIG5vdXZlYXU6IHNpbXBsaWZ5IG5vdXZl
YXVfZG1lbV9taWdyYXRlX3RvX3JhbQogICAgICBub3V2ZWF1OiBzaW1wbGlmeSBub3V2ZWF1X2Rt
ZW1fbWlncmF0ZV92bWEKICAgICAgbW06IHJlbW92ZSB0aGUgdW51c2VkIE1JR1JBVEVfUEZOX0VS
Uk9SIGZsYWcKICAgICAgbW06IHJlbW92ZSB0aGUgdW51c2VkIE1JR1JBVEVfUEZOX0RFVklDRSBm
bGFnCiAgICAgIG1tOiByZW1vdmUgQ09ORklHX01JR1JBVEVfVk1BX0hFTFBFUgogICAgICByZXNv
dXJjZTogYWRkIGEgbm90IGRldmljZSBtYW5hZ2VkIHJlcXVlc3RfZnJlZV9tZW1fcmVnaW9uIHZh
cmlhbnQKICAgICAgbWVtcmVtYXA6IHJlbW92ZSB0aGUgZGV2IGZpZWxkIGluIHN0cnVjdCBkZXZf
cGFnZW1hcAogICAgICBtZW1yZW1hcDogZG9uJ3QgdXNlIGEgc2VwYXJhdGUgZGV2bSBhY3Rpb24g
Zm9yIGRldm1hcF9tYW5hZ2VkX2VuYWJsZV9nZXQKICAgICAgbWVtcmVtYXA6IHByb3ZpZGUgYSBu
b3QgZGV2aWNlIG1hbmFnZWQgbWVtcmVtYXBfcGFnZXMKICAgICAgbW0vbW11X25vdGlmaWVyczog
cmVtb3ZlIHRoZSBfX21tdV9ub3RpZmllcl9pbnZhbGlkYXRlX3JhbmdlX3N0YXJ0L2VuZCBleHBv
cnRzCiAgICAgIG1tOiBzcGxpdCBvdXQgYSBuZXcgcGFnZXdhbGsuaCBoZWFkZXIgZnJvbSBtbS5o
CiAgICAgIHBhZ2V3YWxrOiBzZXBhcmF0ZSBmdW5jdGlvbiBwb2ludGVycyBmcm9tIGl0ZXJhdG9y
IGRhdGEKICAgICAgcGFnZXdhbGs6IHVzZSBsb2NrZGVwX2Fzc2VydF9oZWxkIGZvciBsb2NraW5n
IHZhbGlkYXRpb24KCkRhbiBXaWxsaWFtcyAoMSk6CiAgICAgIGxpYm52ZGltbTogRW5hYmxlIHVu
aXQgdGVzdCBpbmZyYXN0cnVjdHVyZSBjb21waWxlIGNoZWNrcwoKRGFuaWVsIFZldHRlciAoNik6
CiAgICAgIG1tL21tdV9ub3RpZmllcnM6IGNoZWNrIGlmIG1tdSBub3RpZmllciBjYWxsYmFja3Mg
YXJlIGFsbG93ZWQgdG8gZmFpbAogICAgICBtbS9tbXVfbm90aWZpZXJzOiBhZGQgYSBsb2NrZGVw
IG1hcCBmb3IgaW52YWxpZGF0ZV9yYW5nZV9zdGFydC9lbmQKICAgICAgbW0vbW11X25vdGlmaWVy
czogcHJpbWUgbG9ja2RlcAogICAgICBtbS9tbXVfbm90aWZpZXJzOiBhbm5vdGF0ZSB3aXRoIG1p
Z2h0X3NsZWVwKCkKICAgICAga2VybmVsLmg6IEFkZCBub25fYmxvY2tfc3RhcnQvZW5kKCkKICAg
ICAgbW0sIG5vdGlmaWVyOiBDYXRjaCBzbGVlcGluZy9ibG9ja2luZyBmb3IgIWJsb2NrYWJsZQoK
SmFzb24gR3VudGhvcnBlICgyNyk6CiAgICAgIG1tL2htbTogY29tbWVudCBvbiBWTV9GQVVMVF9S
RVRSWSBzZW1hbnRpY3MgaW4gaGFuZGxlX21tX2ZhdWx0CiAgICAgIG1tL21tdV9ub3RpZmllcnM6
IGhvaXN0IGRvX21tdV9ub3RpZmllcl9yZWdpc3RlciBkb3duX3dyaXRlIHRvIHRoZSBjYWxsZXIK
ICAgICAgbW0vbW11X25vdGlmaWVyczogZG8gbm90IHNwZWN1bGF0aXZlbHkgYWxsb2NhdGUgYSBt
bXVfbm90aWZpZXJfbW0KICAgICAgbW0vbW11X25vdGlmaWVyczogYWRkIGEgZ2V0L3B1dCBzY2hl
bWUgZm9yIHRoZSByZWdpc3RyYXRpb24KICAgICAgbWlzYy9zZ2ktZ3J1OiB1c2UgbW11X25vdGlm
aWVyX2dldC9wdXQgZm9yIHN0cnVjdCBncnVfbW1fc3RydWN0CiAgICAgIGhtbTogdXNlIG1tdV9u
b3RpZmllcl9nZXQvcHV0IGZvciAnc3RydWN0IGhtbScKICAgICAgZHJtL3JhZGVvbjogdXNlIG1t
dV9ub3RpZmllcl9nZXQvcHV0IGZvciBzdHJ1Y3QgcmFkZW9uX21uCiAgICAgIGRybS9hbWRrZmQ6
IGZpeCBhIHVzZSBhZnRlciBmcmVlIHJhY2Ugd2l0aCBtbXVfbm90aWZlciB1bnJlZ2lzdGVyCiAg
ICAgIGRybS9hbWRrZmQ6IHVzZSBtbXVfbm90aWZpZXJfcHV0CiAgICAgIE1lcmdlICdub3RpZmll
cl9nZXRfcHV0JyBpbnRvIGhtbS5naXQKICAgICAgUkRNQS9vZHA6IFVzZSB0aGUgY29tbW9uIGlu
dGVydmFsIHRyZWUgbGlicmFyeSBpbnN0ZWFkIG9mIGdlbmVyaWMKICAgICAgUkRNQS9vZHA6IEl0
ZXJhdGUgb3ZlciB0aGUgd2hvbGUgcmJ0cmVlIGRpcmVjdGx5CiAgICAgIFJETUEvb2RwOiBNYWtl
IGl0IGNsZWFyZXIgd2hlbiBhIHVtZW0gaXMgYW4gaW1wbGljaXQgT0RQIHVtZW0KICAgICAgUk1E
QS9vZHA6IENvbnNvbGlkYXRlIHVtZW1fb2RwIGluaXRpYWxpemF0aW9uCiAgICAgIFJETUEvb2Rw
OiBNYWtlIHRoZSB0aHJlZSB3YXlzIHRvIGNyZWF0ZSBhIHVtZW1fb2RwIGNsZWFyCiAgICAgIFJE
TUEvb2RwOiBTcGxpdCBjcmVhdGluZyBhIHVtZW1fb2RwIGZyb20gaWJfdW1lbV9nZXQKICAgICAg
UkRNQS9vZHA6IFByb3ZpZGUgaWJfdW1lbV9vZHBfcmVsZWFzZSgpIHRvIHVuZG8gdGhlIGFsbG9j
cwogICAgICBSRE1BL29kcDogQ2hlY2sgZm9yIG92ZXJmbG93IHdoZW4gY29tcHV0aW5nIHRoZSB1
bWVtX29kcCBlbmQKICAgICAgUkRNQS9vZHA6IFVzZSBrdmNhbGxvYyBmb3IgdGhlIGRtYV9saXN0
IGFuZCBwYWdlX2xpc3QKICAgICAgUkRNQS9tbHg1OiBVc2UgaWJfdW1lbV9zdGFydCBpbnN0ZWFk
IG9mIHVtZW0uYWRkcmVzcwogICAgICBSRE1BL21seDU6IFVzZSBvZHAgaW5zdGVhZCBvZiBtci0+
dW1lbSBpbiBwYWdlZmF1bHRfbXIKICAgICAgTWVyZ2UgYnJhbmNoICdvZHBfZml4ZXMnIGludG8g
aG1tLmdpdAogICAgICBSRE1BL29kcDogdXNlIG1tdV9ub3RpZmllcl9nZXQvcHV0IGZvciAnc3Ry
dWN0IGliX3Vjb250ZXh0X3Blcl9tbScKICAgICAgUkRNQS9vZHA6IHJlbW92ZSBpYl91Y29udGV4
dCBmcm9tIGliX3VtZW0KICAgICAgbW0vbW11X25vdGlmaWVyczogcmVtb3ZlIHVucmVnaXN0ZXJf
bm9fcmVsZWFzZQogICAgICBjc2t5OiBhZGQgbWlzc2luZyBicmFja2V0cyBpbiBhIG1hY3JvIGZv
ciB0bGIuaAogICAgICBkcm0vcmFkZW9uOiBndWFyZCBhZ2FpbnN0IGNhbGxpbmcgYW4gdW5wYWly
ZWQgcmFkZW9uX21uX3VucmVnaXN0ZXIoKQoKTW9uaSBTaG91YSAoMSk6CiAgICAgIFJETUEvY29y
ZTogTWFrZSBpbnZhbGlkYXRlX3JhbmdlIGEgZGV2aWNlIG9wZXJhdGlvbgoKUmFscGggQ2FtcGJl
bGwgKDYpOgogICAgICBtbS9obW06IHJlcGxhY2UgaG1tX3VwZGF0ZSB3aXRoIG1tdV9ub3RpZmll
cl9yYW5nZQogICAgICBtbS9obW06IGEgZmV3IG1vcmUgQyBzdHlsZSBhbmQgY29tbWVudCBjbGVh
biB1cHMKICAgICAgbW0vaG1tOiByZW1vdmUgaHVnZXRsYmZzIGNoZWNrIGluIGhtbV92bWFfd2Fs
a19wbWQKICAgICAgbW0vaG1tOiByZW1vdmUgaG1tX3JhbmdlIHZtYQogICAgICBtbS9obW06IGht
bV9yYW5nZV9mYXVsdCgpIE5VTEwgcG9pbnRlciBidWcKICAgICAgbW0vaG1tOiBobW1fcmFuZ2Vf
ZmF1bHQoKSBpbmZpbml0ZSBsb29wCgpZYW5nLCBQaGlsaXAgKDEpOgogICAgICBtbS9obW06IGZp
eCBobW1fcmFuZ2VfZmF1bHQoKSdzIGhhbmRsaW5nIG9mIHN3YXBwZWQgb3V0IHBhZ2VzCgogRG9j
dW1lbnRhdGlvbi92bS9obW0ucnN0ICAgICAgICAgICAgICAgICB8ICA3MyArLS0tLQogYXJjaC9j
c2t5L2luY2x1ZGUvYXNtL3RsYi5oICAgICAgICAgICAgICB8ICAgOCArLQogYXJjaC9vcGVucmlz
Yy9rZXJuZWwvZG1hLmMgICAgICAgICAgICAgICB8ICAyMyArLQogYXJjaC9wb3dlcnBjL21tL2Jv
b2szczY0L3N1YnBhZ2VfcHJvdC5jICB8ICAxMiArLQogYXJjaC9zMzkwL21tL2dtYXAuYyAgICAg
ICAgICAgICAgICAgICAgICB8ICAzNSArLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L0tj
b25maWcgICAgICAgfCAgIDQgKy0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9k
cnYuYyAgfCAgIDIgKwogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X21uLmMgICB8
ICAxNSArLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3R0bS5jICB8ICAzMSAr
LQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX3ByaXYuaCAgICB8ICAgMyAtCiBkcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfcHJvY2Vzcy5jIHwgIDg4ICsrKy0tLQogZHJpdmVy
cy9ncHUvZHJtL25vdXZlYXUvS2NvbmZpZyAgICAgICAgICB8ICAgNSArLQogZHJpdmVycy9ncHUv
ZHJtL25vdXZlYXUvbm91dmVhdV9kbWVtLmMgICB8IDQ1NiArKysrKysrKystLS0tLS0tLS0tLS0t
LS0tLS0KIGRyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfZG1lbS5oICAgfCAgMTEgLQog
ZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9kcm0uYyAgICB8ICAgMyArCiBkcml2ZXJz
L2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X3N2bS5jICAgIHwgIDIzICstCiBkcml2ZXJzL2dwdS9k
cm0vcmFkZW9uL3JhZGVvbi5oICAgICAgICAgIHwgICAzIC0KIGRyaXZlcnMvZ3B1L2RybS9yYWRl
b24vcmFkZW9uX2RldmljZS5jICAgfCAgIDIgLQogZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRl
b25fZHJ2LmMgICAgICB8ICAgMiArCiBkcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl9tbi5j
ICAgICAgIHwgMTU2ICsrKy0tLS0tLQogZHJpdmVycy9pbmZpbmliYW5kL0tjb25maWcgICAgICAg
ICAgICAgICB8ICAgMSArCiBkcml2ZXJzL2luZmluaWJhbmQvY29yZS9kZXZpY2UuYyAgICAgICAg
IHwgICAxICsKIGRyaXZlcnMvaW5maW5pYmFuZC9jb3JlL3VtZW0uYyAgICAgICAgICAgfCAgNTQg
Ky0tLQogZHJpdmVycy9pbmZpbmliYW5kL2NvcmUvdW1lbV9vZHAuYyAgICAgICB8IDUyNCArKysr
KysrKysrKysrKystLS0tLS0tLS0tLS0tLS0tCiBkcml2ZXJzL2luZmluaWJhbmQvY29yZS91dmVy
YnNfY21kLmMgICAgIHwgICA1IC0KIGRyaXZlcnMvaW5maW5pYmFuZC9jb3JlL3V2ZXJic19tYWlu
LmMgICAgfCAgIDEgKwogZHJpdmVycy9pbmZpbmliYW5kL2h3L21seDUvbWFpbi5jICAgICAgICB8
ICAgOSAtCiBkcml2ZXJzL2luZmluaWJhbmQvaHcvbWx4NS9tZW0uYyAgICAgICAgIHwgIDEzIC0K
IGRyaXZlcnMvaW5maW5pYmFuZC9ody9tbHg1L21yLmMgICAgICAgICAgfCAgMzggKystCiBkcml2
ZXJzL2luZmluaWJhbmQvaHcvbWx4NS9vZHAuYyAgICAgICAgIHwgIDg4ICsrKy0tLQogZHJpdmVy
cy9taXNjL3NnaS1ncnUvZ3J1ZmlsZS5jICAgICAgICAgICB8ICAgMSArCiBkcml2ZXJzL21pc2Mv
c2dpLWdydS9ncnV0YWJsZXMuaCAgICAgICAgIHwgICAyIC0KIGRyaXZlcnMvbWlzYy9zZ2ktZ3J1
L2dydXRsYnB1cmdlLmMgICAgICAgfCAgODQgKystLS0KIGRyaXZlcnMvbnZkaW1tL0tjb25maWcg
ICAgICAgICAgICAgICAgICAgfCAgMTIgKwogZHJpdmVycy9udmRpbW0vTWFrZWZpbGUgICAgICAg
ICAgICAgICAgICB8ICAgNCArCiBmcy9wcm9jL3Rhc2tfbW11LmMgICAgICAgICAgICAgICAgICAg
ICAgIHwgIDgwICsrLS0tCiBpbmNsdWRlL2xpbnV4L2htbS5oICAgICAgICAgICAgICAgICAgICAg
IHwgMTI1ICsrLS0tLS0tCiBpbmNsdWRlL2xpbnV4L2lvcG9ydC5oICAgICAgICAgICAgICAgICAg
IHwgICAyICsKIGluY2x1ZGUvbGludXgva2VybmVsLmggICAgICAgICAgICAgICAgICAgfCAgMjMg
Ky0KIGluY2x1ZGUvbGludXgvbWVtcmVtYXAuaCAgICAgICAgICAgICAgICAgfCAgIDMgKy0KIGlu
Y2x1ZGUvbGludXgvbWlncmF0ZS5oICAgICAgICAgICAgICAgICAgfCAxMjAgKystLS0tLQogaW5j
bHVkZS9saW51eC9tbS5oICAgICAgICAgICAgICAgICAgICAgICB8ICA0NiAtLS0KIGluY2x1ZGUv
bGludXgvbW1fdHlwZXMuaCAgICAgICAgICAgICAgICAgfCAgIDYgLQogaW5jbHVkZS9saW51eC9t
bXVfbm90aWZpZXIuaCAgICAgICAgICAgICB8ICA1OSArKystCiBpbmNsdWRlL2xpbnV4L3BhZ2V3
YWxrLmggICAgICAgICAgICAgICAgIHwgIDY2ICsrKysKIGluY2x1ZGUvbGludXgvc2NoZWQuaCAg
ICAgICAgICAgICAgICAgICAgfCAgIDQgKwogaW5jbHVkZS9yZG1hL2liX3VtZW0uaCAgICAgICAg
ICAgICAgICAgICB8ICAgMiArLQogaW5jbHVkZS9yZG1hL2liX3VtZW1fb2RwLmggICAgICAgICAg
ICAgICB8ICA1OCArKy0tCiBpbmNsdWRlL3JkbWEvaWJfdmVyYnMuaCAgICAgICAgICAgICAgICAg
IHwgICA3ICstCiBrZXJuZWwvZm9yay5jICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgICAx
IC0KIGtlcm5lbC9yZXNvdXJjZS5jICAgICAgICAgICAgICAgICAgICAgICAgfCAgNDUgKystCiBr
ZXJuZWwvc2NoZWQvY29yZS5jICAgICAgICAgICAgICAgICAgICAgIHwgIDE5ICstCiBtbS9LY29u
ZmlnICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDIwICstCiBtbS9obW0uYyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgNDkwICsrKysrKysrKy0tLS0tLS0tLS0tLS0t
LS0tLS0tCiBtbS9tYWR2aXNlLmMgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDQyICst
LQogbW0vbWVtY29udHJvbC5jICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAyNSArLQogbW0v
bWVtcG9saWN5LmMgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAxNyArLQogbW0vbWVtcmVt
YXAuYyAgICAgICAgICAgICAgICAgICAgICAgICAgICB8IDEwNSArKysrLS0tCiBtbS9taWdyYXRl
LmMgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgMjc2ICsrKysrKysrLS0tLS0tLS0KIG1t
L21pbmNvcmUuYyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgMTcgKy0KIG1tL21tdV9u
b3RpZmllci5jICAgICAgICAgICAgICAgICAgICAgICAgfCAyNjMgKysrKysrKysrKysrLS0tLQog
bW0vbXByb3RlY3QuYyAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAyNiArLQogbW0vcGFn
ZV9hbGxvYy5jICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAgMiArLQogbW0vcGFnZXdhbGsu
YyAgICAgICAgICAgICAgICAgICAgICAgICAgICB8IDEyNiArKysrLS0tLQogdG9vbHMvdGVzdGlu
Zy9udmRpbW0vdGVzdC9pb21hcC5jICAgICAgICB8ICAgMSAtCiA2NSBmaWxlcyBjaGFuZ2VkLCAx
Njg0IGluc2VydGlvbnMoKyksIDIxODQgZGVsZXRpb25zKC0pCiBjcmVhdGUgbW9kZSAxMDA2NDQg
aW5jbHVkZS9saW51eC9wYWdld2Fsay5oCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
YW1kLWdmeA==
