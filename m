Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2099E6533E
	for <lists+amd-gfx@lfdr.de>; Thu, 11 Jul 2019 10:33:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC1306E15C;
	Thu, 11 Jul 2019 08:33:57 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr810050.outbound.protection.outlook.com [40.107.81.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3ACE6E15C
 for <amd-gfx@lists.freedesktop.org>; Thu, 11 Jul 2019 08:33:56 +0000 (UTC)
Received: from BN8PR12MB3602.namprd12.prod.outlook.com (20.178.212.86) by
 BN8PR12MB3297.namprd12.prod.outlook.com (20.179.65.209) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2052.19; Thu, 11 Jul 2019 08:33:54 +0000
Received: from BN8PR12MB3602.namprd12.prod.outlook.com
 ([fe80::8d31:f3d2:a080:9a9c]) by BN8PR12MB3602.namprd12.prod.outlook.com
 ([fe80::8d31:f3d2:a080:9a9c%5]) with mapi id 15.20.2052.020; Thu, 11 Jul 2019
 08:33:54 +0000
From: "Yuan, Xiaojie" <Xiaojie.Yuan@amd.com>
To: "Yin, Tianci (Rico)" <Tianci.Yin@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/amdgpu/discovery: fix DCE_HWIP mapping error in
 hw_id_map array
Thread-Topic: [PATCH] drm/amdgpu/discovery: fix DCE_HWIP mapping error in
 hw_id_map array
Thread-Index: AQHVN77M+V2BszwHrU+D6Oq7OEiXWabFFzLN
Date: Thu, 11 Jul 2019 08:33:54 +0000
Message-ID: <BN8PR12MB3602D2A0FD4F61A6ED102A0289F30@BN8PR12MB3602.namprd12.prod.outlook.com>
References: <1562832050-28203-1-git-send-email-tianci.yin@amd.com>
In-Reply-To: <1562832050-28203-1-git-send-email-tianci.yin@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3d1a7e4c-eb95-4149-a862-08d705da82ae
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BN8PR12MB3297; 
x-ms-traffictypediagnostic: BN8PR12MB3297:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <BN8PR12MB3297DD5AC2F33DFAA6EAD82089F30@BN8PR12MB3297.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1751;
x-forefront-prvs: 0095BCF226
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(136003)(366004)(376002)(346002)(39860400002)(199004)(189003)(55016002)(66476007)(53936002)(66556008)(6436002)(64756008)(66946007)(66446008)(76116006)(966005)(305945005)(486006)(478600001)(102836004)(7736002)(52536014)(5660300002)(33656002)(53546011)(2906002)(74316002)(66066001)(81166006)(8676002)(81156014)(6306002)(9686003)(186003)(26005)(476003)(229853002)(6506007)(76176011)(71200400001)(71190400001)(8936002)(7696005)(316002)(110136005)(54906003)(11346002)(86362001)(14444005)(99286004)(6116002)(14454004)(3846002)(68736007)(4326008)(25786009)(256004)(6246003)(2501003)(446003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN8PR12MB3297;
 H:BN8PR12MB3602.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: F/PdHROdIiYZEBQvXwJsaJz8123vvw4cL8vYz5HCm5vGnlQjCMQrh8wddndip7D8rJT8f4hz9pO9DsN5LkNuOwapoT9vhbdB6a0wKloBwCwzBLZgkkfjlLuWU6OGkWgtwl/u0QkMWjOByhhQIdUW6bpXsla2oz1ZoUbeOa/NUTGnoxRsLTftl5UpeRInSrce46K1vxbqy5zS5QthgNfnmOTGCXyz40JAXRUfJVp0IIvOCFbsOkpcqUKMhMQxeRQfl8XB1iif/T7aUf7j6Pwb1YzH/2FhpdKhnSov0YdwRHET3oxd3Fpc/sunxU42iSetD0j6baD12OuanDx0kwxMeV2bfFDFXDmvqjh9Dj4lpQ50GB80s40veGzQ+xnxLCh/VhEU9ExplXeO6RJHoOI34OFJ8BD+ul59J60zYTV/4OA=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d1a7e4c-eb95-4149-a862-08d705da82ae
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jul 2019 08:33:54.8339 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xiyuan@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB3297
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hQl57coD8r15HKGgEXkjvNMviw7SrHaFeHYlXStIx4k=;
 b=PCJNanN8xWhCL8goXxWPO+rr8X0kkOn3pNde9yo+z3IavcnvfJ8mrEBNXMQA9q3mX019reBe3hEbjC5Qh47ncVOcrbsllLXULYl5HoIyKKQx1VPUjsB2YhGY/dzIoZrys1iuHhNz3qxkKMld70bBBxJ+PtwhVahMfeDuvIU8McE=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Xiaojie.Yuan@amd.com; 
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
Cc: "Xiao, Jack" <Jack.Xiao@amd.com>, "Zhang, Hawking" <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

UmV2aWV3ZWQtYnk6IFhpYW9qaWUgWXVhbiA8eGlhb2ppZS55dWFuQGFtZC5jb20+CgpCUiwKWGlh
b2ppZQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpGcm9tOiBhbWQt
Z2Z4IDxhbWQtZ2Z4LWJvdW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPiBvbiBiZWhhbGYgb2Yg
VGlhbmNpIFlpbiA8dGlhbmNpLnlpbkBhbWQuY29tPgpTZW50OiBUaHVyc2RheSwgSnVseSAxMSwg
MjAxOSA0OjAwIFBNClRvOiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpDYzogWGlhbywg
SmFjazsgWXVhbiwgWGlhb2ppZTsgWWluLCBUaWFuY2kgKFJpY28pOyBaaGFuZywgSGF3a2luZwpT
dWJqZWN0OiBbUEFUQ0hdIGRybS9hbWRncHUvZGlzY292ZXJ5OiBmaXggRENFX0hXSVAgbWFwcGlu
ZyBlcnJvciBpbiBod19pZF9tYXAgYXJyYXkKCkZyb206IHRpYW5jeWluIDx0aWFuY2kueWluQGFt
ZC5jb20+CgpJRCBvZiBEQ0VfSFdJUCBmcm9tIHZiaW9zIGlzIERNVV9IV0lELAptaXNtYXRjaCBj
YXVzZSBudWxsIHBvaW50ZXIgY3Jhc2ggaW4gbmF2aTEwIG1vZHByb2JlLgoKQ2hhbmdlLUlkOiBJ
M2JlMzYzY2Y1MjQ4ZGU5MDRiM2JkYWUyZjM0ZDNiYmUwYmJiYzA3ZApTaWduZWQtb2ZmLWJ5OiB0
aWFuY3lpbiA8dGlhbmNpLnlpbkBhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2FtZGdwdV9kaXNjb3ZlcnkuYyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlv
bigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2FtZGdwdV9kaXNjb3ZlcnkuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdw
dV9kaXNjb3ZlcnkuYwppbmRleCBlMDQ5YWU2Li4xNDgxODk5IDEwMDY0NAotLS0gYS9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGlzY292ZXJ5LmMKKysrIGIvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rpc2NvdmVyeS5jCkBAIC0xMjMsNyArMTIzLDcgQEAgc3Rh
dGljIGludCBod19pZF9tYXBbTUFYX0hXSVBdID0gewogICAgICAgIFtVVkRfSFdJUF0gICAgICA9
IFVWRF9IV0lELAogICAgICAgIFtWQ0VfSFdJUF0gICAgICA9IFZDRV9IV0lELAogICAgICAgIFtE
Rl9IV0lQXSAgICAgICA9IERGX0hXSUQsCi0gICAgICAgW0RDRV9IV0lQXSAgICAgID0gRENFQVpf
SFdJRCwKKyAgICAgICBbRENFX0hXSVBdICAgICAgPSBETVVfSFdJRCwKICAgICAgICBbT1NTU1lT
X0hXSVBdICAgPSBPU1NTWVNfSFdJRCwKICAgICAgICBbU01VSU9fSFdJUF0gICAgPSBTTVVJT19I
V0lELAogICAgICAgIFtQV1JfSFdJUF0gICAgICA9IFBXUl9IV0lELAotLQoyLjcuNAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5n
IGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4Cl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vYW1kLWdmeA==
