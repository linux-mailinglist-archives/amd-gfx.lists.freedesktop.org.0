Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C112A98A1
	for <lists+amd-gfx@lfdr.de>; Thu,  5 Sep 2019 04:56:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB58689CB2;
	Thu,  5 Sep 2019 02:56:41 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700045.outbound.protection.outlook.com [40.107.70.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E651E89CB2
 for <amd-gfx@lists.freedesktop.org>; Thu,  5 Sep 2019 02:56:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RqpqmdQCuO7r3EpqWPVNcc6tWNH+IPaLjBr4p+Kp4D8wTcAQcONFKYB2g6Hh42XlnFhiaxzhcHzfdkP92qVPxCeKFxcQUZ/T9Xvt/G+nx28YrHIfOO+QCYyjT3BmHEmZU8uNcXCKUrvNN307zFb7KH11GGDNq0lr2j+LUJde3Way10dhDfM6irOR9YT+UxPKPF6g+wPIw9c6zyTGWGgZRpZDQfjLkC4iJQsSxZzaL2nb8ygClEGFGNcFgAQmAeuVXXfCl9rhPJTkmx77fT/KD1rZBsfX40oEOwreX/t05V0Q/3F+Km7zQ3YfCVrt5PcfZi+tc9ekB1k5yvvuXd1hRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E4MiU5/3smfr4iU2btZwIST2OdptsC3BqJ+O/qk0CfM=;
 b=kBf52N5WTA82w4hE5K+UUzWqNwyVi+2QVgFj5d23H44YwfHxrRPIZTJwwqWQkBRjEpmCi32hINloQSZCBqvuy1molPaWgwPBcjlCwBCwl0iP1nWDfKjbqHEHR8t4wM6JBe3VMJciv2ZEgB7Y1XfIGU3PtzV/3tJYY8+RBZn14Zqr3n46q1YynAL8ZPJEepCl6kEi7t5396CeG5UrBTS/HJzsPAqSJQqPhIYkEGoTAVhUfvTAYuehXRFEzRCLQHSaEbyhUEIAaccvinIXu8cG07IzQ6AtLezE0nJXJFN1MKWf8HBixY2oaYuzKtw7JWq3Af4srYCvk55rG75yHN0BIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from SN6PR12MB2813.namprd12.prod.outlook.com (52.135.100.27) by
 SN6PR12MB2605.namprd12.prod.outlook.com (52.135.102.158) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2220.21; Thu, 5 Sep 2019 02:56:39 +0000
Received: from SN6PR12MB2813.namprd12.prod.outlook.com
 ([fe80::b806:60aa:1bb:9117]) by SN6PR12MB2813.namprd12.prod.outlook.com
 ([fe80::b806:60aa:1bb:9117%3]) with mapi id 15.20.2199.021; Thu, 5 Sep 2019
 02:56:39 +0000
From: "Chen, Guchun" <Guchun.Chen@amd.com>
To: "Grodzovsky, Andrey" <Andrey.Grodzovsky@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH 2/3] drm/amdgpu: Remove clock gating restore.
Thread-Topic: [PATCH 2/3] drm/amdgpu: Remove clock gating restore.
Thread-Index: AQHVY5SygXEFCGG500OMgLJblbrBHqccY5YA
Date: Thu, 5 Sep 2019 02:56:39 +0000
Message-ID: <SN6PR12MB28137A7EA317299230681E67F1BB0@SN6PR12MB2813.namprd12.prod.outlook.com>
References: <1567651818-7911-1-git-send-email-andrey.grodzovsky@amd.com>
 <1567651818-7911-2-git-send-email-andrey.grodzovsky@amd.com>
In-Reply-To: <1567651818-7911-2-git-send-email-andrey.grodzovsky@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d2ab3d30-4b79-4c97-dd6a-08d731acac84
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:SN6PR12MB2605; 
x-ms-traffictypediagnostic: SN6PR12MB2605:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SN6PR12MB26057E690F44C2BF83AB7D66F1BB0@SN6PR12MB2605.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-forefront-prvs: 015114592F
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(346002)(39860400002)(136003)(376002)(366004)(13464003)(199004)(189003)(53546011)(6506007)(102836004)(26005)(76176011)(256004)(14444005)(66476007)(446003)(71190400001)(71200400001)(11346002)(476003)(66446008)(186003)(486006)(64756008)(81156014)(66066001)(5660300002)(81166006)(66556008)(2906002)(7696005)(8936002)(52536014)(6246003)(14454004)(74316002)(99286004)(7736002)(8676002)(316002)(229853002)(305945005)(53936002)(86362001)(25786009)(55016002)(9686003)(110136005)(33656002)(3846002)(6116002)(66946007)(76116006)(478600001)(4326008)(6436002)(54906003)(2501003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:SN6PR12MB2605;
 H:SN6PR12MB2813.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: CKnKrjBAWiSiVxDFitbg7tqWmQsotzMCAL5CECc6skl9wW3MB6A04Qm5S8p363rbrPL7KCnGIQEw5K54EMwr9eD2zJjRTLYXm4A9ZHlY3KTUetV6fghIZ0pWeYVqILgP881jpR9TMMK84wYWU6hexKl0nkP/AKflBD5cEi2lMRxz+0doK+ZJwukmYhKaGNg5UtM6wqSEZwrX4AA/LrKGhJMzD3b9xW/bXlSPhxfrIgUtq+fNMDaQ+ebz/GZqGNDmwuz50sNpCD8BqdNofu4H6ioAI16lb6a4gEpaeIP5eSzMVjhhmSq9/LazlGHGTyoTfpcpgPOP9CHK430Ae9MpwBp6yoSXuKYum2oY1HCTDakaheKi3xnaje//v0zeVrEVjZjS0txKT/r4wZjYdLrfEJnxlm4/MgEfv2jvoSW+vgo=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d2ab3d30-4b79-4c97-dd6a-08d731acac84
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Sep 2019 02:56:39.2590 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1mwzi7CJ/n697Di0Fd2F+vSUiiUqKCXmZApZmye2xMRIn2K/dBNCZ7shEdCatNxCy4ilcmnvEjXsocE5WZTZMQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB2605
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E4MiU5/3smfr4iU2btZwIST2OdptsC3BqJ+O/qk0CfM=;
 b=QqxZfiD8zucO84XUY/wWcimdN0dr/OGxikd5mTnNA9AROmt+bNGAsZZGdfnbb6NEv3GPpDCCBfmpqbEqwHVvKKgJ6VjBvzTBtfHeXWsvLUa2IO4dZABHw/Kg9sthhSBjhXVYAAy6d2oVhuCTUtl1QHV1/BlbetunxfgFOxRISOQ=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Guchun.Chen@amd.com; 
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
Cc: "alexdeucher@gmail.com" <alexdeucher@gmail.com>, "Saceleanu,
 Cristian" <Cristian.Saceleanu@amd.com>, "Zhou1, Tao" <Tao.Zhou1@amd.com>,
 "Grodzovsky, Andrey" <Andrey.Grodzovsky@amd.com>, "Zhang,
 Hawking" <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

UmV2aWV3ZWQtYnk6IEd1Y2h1biBDaGVuIDxndWNodW4uY2hlbkBhbWQuY29tPgpUZXN0ZWQtYnk6
IEd1Y2h1biBDaGVuIDxndWNodW4uY2hlbkBhbWQuY29tPgoKCi0tLS0tT3JpZ2luYWwgTWVzc2Fn
ZS0tLS0tCkZyb206IEFuZHJleSBHcm9kem92c2t5IDxhbmRyZXkuZ3JvZHpvdnNreUBhbWQuY29t
PiAKU2VudDogVGh1cnNkYXksIFNlcHRlbWJlciA1LCAyMDE5IDEwOjUwIEFNClRvOiBhbWQtZ2Z4
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpDYzogYWxleGRldWNoZXJAZ21haWwuY29tOyBaaGFuZywg
SGF3a2luZyA8SGF3a2luZy5aaGFuZ0BhbWQuY29tPjsgWmhvdTEsIFRhbyA8VGFvLlpob3UxQGFt
ZC5jb20+OyBDaGVuLCBHdWNodW4gPEd1Y2h1bi5DaGVuQGFtZC5jb20+OyBTYWNlbGVhbnUsIENy
aXN0aWFuIDxDcmlzdGlhbi5TYWNlbGVhbnVAYW1kLmNvbT47IEdyb2R6b3Zza3ksIEFuZHJleSA8
QW5kcmV5Lkdyb2R6b3Zza3lAYW1kLmNvbT4KU3ViamVjdDogW1BBVENIIDIvM10gZHJtL2FtZGdw
dTogUmVtb3ZlIGNsb2NrIGdhdGluZyByZXN0b3JlLgoKUmVzdG9yaW5nIGNsb2NrIGdhdGluZyBi
cmVhayBTTVUgb3BlYXJ0aW9uIGFmdGVyd2FyZHMsIGF2b2lkIHRoaXMgdW50aWwgdGhpcyBmdXJ0
aGVyIGludmlzdGlnYXRlZCB3aXRoIFNNVS4KClNpZ25lZC1vZmYtYnk6IEFuZHJleSBHcm9kem92
c2t5IDxhbmRyZXkuZ3JvZHpvdnNreUBhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L3NtdV92MTFfMF9pMmMuYyB8IDEwICsrKysrKysrKy0KIDEgZmlsZSBjaGFuZ2VkLCA5
IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9zbXVfdjExXzBfaTJjLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9zbXVfdjExXzBfaTJjLmMKaW5kZXggN2QwZDRjNS4uOTUyNjZmZSAxMDA2NDQKLS0tIGEvZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvc211X3YxMV8wX2kyYy5jCisrKyBiL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L3NtdV92MTFfMF9pMmMuYwpAQCAtNDkxLDcgKzQ5MSwxNSBAQCBzdGF0
aWMgdm9pZCBzbXVfdjExXzBfaTJjX2Zpbmkoc3RydWN0IGkyY19hZGFwdGVyICpjb250cm9sKQog
CX0KIAogCS8qIFJlc3RvcmUgY2xvY2sgZ2F0aW5nICovCi0Jc211X3YxMV8wX2kyY19zZXRfY2xv
Y2tfZ2F0aW5nKGNvbnRyb2wsIHRydWUpOworCisJLyoKKwkgKlRPRE8gUmVlbmFibGluZyBjbG9j
ayBnYXRpbmcgc2VlbXMgdG8gYnJlYWsgc3Vic2VxdWVudCBTTVUgb3BlcmF0aW9uCisJICpvbiB0
aGUgSTJDIGJ1cy4gTXkgZ3Vlc3MgaXMgdGhhdCBTTVUgZG9lc24ndCBkaXNhYmxlIGNsb2NrIGdh
dGluZyBsaWtlCisJICp3ZSBkbyBoZXJlIGJlZm9yZSB3b3JraW5nIHdpdGggdGhlIGJ1cy4gU28g
Zm9yIG5vdyBqdXN0IGRvbid0IHJlc3RvcmUKKwkgKml0IGJ1dCBsYXRlciB3b3JrIHdpdGggU01V
IHRvIHNlZSBpZiB0aGV5IGhhdmUgdGhpcyBpc3N1ZSBhbmQgY2FuCisJICp1cGRhdGUgdGhlaXIg
Y29kZSBhcHByb3ByaWF0ZWx5CisJICovCisJLyogc211X3YxMV8wX2kyY19zZXRfY2xvY2tfZ2F0
aW5nKGNvbnRyb2wsIHRydWUpOyAqLwogCiB9CiAKLS0KMi43LjQKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1n
ZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
