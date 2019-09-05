Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36222A98A2
	for <lists+amd-gfx@lfdr.de>; Thu,  5 Sep 2019 04:57:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFF9989CC4;
	Thu,  5 Sep 2019 02:57:01 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700054.outbound.protection.outlook.com [40.107.70.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03B9F89CC4
 for <amd-gfx@lists.freedesktop.org>; Thu,  5 Sep 2019 02:57:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iLa7yjuBgLlVTVLtHrwRaCqgsZAYLkS8sLjNr1RQTO3ihP6G2qsvqXoJXsXgTgQVY3bT6jaw4ylg7FRZ1PjjqBk8lZ4NImEqCRBGWEz/T6dC+dOVRxzS5dg2LjS2yV/K7RQ4cMSIRS1P1GzpbPHK90eDvFIvQIdmKsqQ5mMxEq4zg5uLAx2wwK8TqJvKz+IU/VI6icXWxC4GWJCLZ7IgbNAnnZQ6eu3F2SYDr5YPAEvJWj5h4q5fCOtkR13qVpuRO/K9EVb7uAfmdgROz8Y3FHGu2URhg53wjbceGRGkLtfRV0ntuZYZm03JkyKjNB8XPyzPMxeEiLvTsBH6CoX/lQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dBeQkvhwH+DKtuIHDT0+QQOn4DLAbn1vk869+KZcTWE=;
 b=YjbsYN4Ih0Cczq+ENRms+4ViJbJtlLKarFg6vQV7EyQp+yLa3P7PqqzyGpb0KA7IaC2gTjNckSnO5F55fO12BzuU9hN8iAacEFYUY+UnxuaBmRzOtz9CAwbuyHpAESP+zZzDwFy3ymkSZABifOfgs8HK4PocHZP+4VRkWwY7yqxTqNEeKbF9HGARPY3sGpoAne/wE723V78qixOYu9kSspwQ056ijeyVd+4Ney7Ps7YU6cBwCSZ3YNQ1l4vfmm8GRK/F95tLzrrAbKLQao7wZ3sHM3oP51WLimTflqNzinoCdTe6T/LT7IqCE+y0NbOG320c+HXpK7Nv86jwnWGNUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from SN6PR12MB2813.namprd12.prod.outlook.com (52.135.100.27) by
 SN6PR12MB2605.namprd12.prod.outlook.com (52.135.102.158) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2220.21; Thu, 5 Sep 2019 02:56:59 +0000
Received: from SN6PR12MB2813.namprd12.prod.outlook.com
 ([fe80::b806:60aa:1bb:9117]) by SN6PR12MB2813.namprd12.prod.outlook.com
 ([fe80::b806:60aa:1bb:9117%3]) with mapi id 15.20.2199.021; Thu, 5 Sep 2019
 02:56:59 +0000
From: "Chen, Guchun" <Guchun.Chen@amd.com>
To: "Grodzovsky, Andrey" <Andrey.Grodzovsky@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH 3/3] drm/madgpu: Fix EEPROM Checksum calculation.
Thread-Topic: [PATCH 3/3] drm/madgpu: Fix EEPROM Checksum calculation.
Thread-Index: AQHVY5S2vIV0jxUDoEGDrQ3qE0/pBaccY+6A
Date: Thu, 5 Sep 2019 02:56:59 +0000
Message-ID: <SN6PR12MB2813998C2CE5841C2BC71447F1BB0@SN6PR12MB2813.namprd12.prod.outlook.com>
References: <1567651818-7911-1-git-send-email-andrey.grodzovsky@amd.com>
 <1567651818-7911-3-git-send-email-andrey.grodzovsky@amd.com>
In-Reply-To: <1567651818-7911-3-git-send-email-andrey.grodzovsky@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: aff4d01a-6a0b-4a9b-cb0e-08d731acb881
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:SN6PR12MB2605; 
x-ms-traffictypediagnostic: SN6PR12MB2605:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SN6PR12MB2605E5208252FFC6BFFA4F64F1BB0@SN6PR12MB2605.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:305;
x-forefront-prvs: 015114592F
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(346002)(39860400002)(136003)(376002)(366004)(13464003)(199004)(189003)(53546011)(6506007)(102836004)(26005)(76176011)(256004)(66476007)(446003)(71190400001)(71200400001)(11346002)(476003)(66446008)(186003)(486006)(64756008)(81156014)(66066001)(5660300002)(81166006)(66556008)(2906002)(7696005)(8936002)(52536014)(6246003)(14454004)(74316002)(99286004)(7736002)(8676002)(316002)(229853002)(305945005)(53936002)(86362001)(25786009)(55016002)(9686003)(110136005)(33656002)(3846002)(6116002)(66946007)(76116006)(478600001)(4326008)(6436002)(54906003)(2501003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:SN6PR12MB2605;
 H:SN6PR12MB2813.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: k0mBP3yyN//9oa9nBXo0fxs4Rs2q0+VxwFEd6cK3yD4MHeQehDhtXIbGFlQgCT0pwbDCcy2MyM8xMiLtkxi7e3GrBRtEqmYJBLiSRDlsP5RiICCALAD2St1m7+j6QjHH31d7vTfHMqaYjvFsgg2w8VP6ohVZmm/V236EAFyM9dbfRd0kdZ5GUDPmFYz0UKHs/c6sjv+4IPcu3qrG20gnBIfohAxcFRxiKIg21MTrljvVmYv5Gs8Z4gpY34GMeiqS+t0oCHEPbP4p1q44QtVCIkZRuqOdNsLY8FdiyBR8e9QoIZv+5E+Zb4chB6x7cEY8tX1BhznUkvf5E1VulrRkqD8w2VOn6xRCZn7D2gV+ob6wBGqP5Ab3NrrB1NgUctRQIW5ZgwMgUNfOPmDP+sFLD9P8ocriT4XNlFQifJq+ttk=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aff4d01a-6a0b-4a9b-cb0e-08d731acb881
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Sep 2019 02:56:59.4155 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PXgOoxzgi0pJWlsF2IY+qLyIpGjkD43vZ2vGd2MGzsAJgk8Iclql9RhezOmbReFPnfIXe5Zjob1ljDPMPNWdqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB2605
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dBeQkvhwH+DKtuIHDT0+QQOn4DLAbn1vk869+KZcTWE=;
 b=VtQDuUSocOQAde3iB2FbEHFWZ20itgIqueWHFI29f8Kb5Vv5jQG976pjcdXKIKi5ZMIDSaNrCahKymwaxBApdptkob1W1Fce4JfNHtZ24wmR4EXCa602hJFos6V3wldkZYJFZJmXiYCYsnatHGbIdTqhF/Vc7YdVV4pnPCb4gUE=
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

UmV2aWV3ZWQtYnk6IEd1Y2h1biBDaGVuIDxndWNodW4uY2hlbkBhbWQuY29tPgoKCi0tLS0tT3Jp
Z2luYWwgTWVzc2FnZS0tLS0tCkZyb206IEFuZHJleSBHcm9kem92c2t5IDxhbmRyZXkuZ3JvZHpv
dnNreUBhbWQuY29tPiAKU2VudDogVGh1cnNkYXksIFNlcHRlbWJlciA1LCAyMDE5IDEwOjUwIEFN
ClRvOiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpDYzogYWxleGRldWNoZXJAZ21haWwu
Y29tOyBaaGFuZywgSGF3a2luZyA8SGF3a2luZy5aaGFuZ0BhbWQuY29tPjsgWmhvdTEsIFRhbyA8
VGFvLlpob3UxQGFtZC5jb20+OyBDaGVuLCBHdWNodW4gPEd1Y2h1bi5DaGVuQGFtZC5jb20+OyBT
YWNlbGVhbnUsIENyaXN0aWFuIDxDcmlzdGlhbi5TYWNlbGVhbnVAYW1kLmNvbT47IEdyb2R6b3Zz
a3ksIEFuZHJleSA8QW5kcmV5Lkdyb2R6b3Zza3lAYW1kLmNvbT4KU3ViamVjdDogW1BBVENIIDMv
M10gZHJtL21hZGdwdTogRml4IEVFUFJPTSBDaGVja3N1bSBjYWxjdWxhdGlvbi4KCkZpeCB0eXBv
IHdoaWNoIG1lc3NlZCB1cCB0aGUgY2FsY3VsYXRpb24uCgpTaWduZWQtb2ZmLWJ5OiBBbmRyZXkg
R3JvZHpvdnNreSA8YW5kcmV5Lmdyb2R6b3Zza3lAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9hbWRncHVfcmFzX2VlcHJvbS5jIHwgNCArKy0tCiAxIGZpbGUgY2hhbmdl
ZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXNfZWVwcm9tLmMgYi9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9hbWRncHVfcmFzX2VlcHJvbS5jCmluZGV4IDhhMzJiNWMuLjQzZGQ0YWIgMTAw
NjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXNfZWVwcm9tLmMK
KysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Jhc19lZXByb20uYwpAQCAt
MjI2LDggKzIyNiw4IEBAIHN0YXRpYyB2b2lkIF9fZGVjb2RlX3RhYmxlX3JlY29yZF9mcm9tX2J1
ZmYoc3RydWN0IGFtZGdwdV9yYXNfZWVwcm9tX2NvbnRyb2wgKmNvCiAJcmVjb3JkLT5vZmZzZXQg
PSAobGU2NF90b19jcHUodG1wKSAmIDB4ZmZmZmZmZmZmZmZmKTsKIAlpICs9IDY7CiAKLQlidWZm
W2krK10gPSByZWNvcmQtPm1lbV9jaGFubmVsOwotCWJ1ZmZbaSsrXSA9IHJlY29yZC0+bWN1bWNf
aWQ7CisJcmVjb3JkLT5tZW1fY2hhbm5lbCA9IGJ1ZmZbaSsrXTsKKwlyZWNvcmQtPm1jdW1jX2lk
ID0gYnVmZltpKytdOwogCiAJbWVtY3B5KCZ0bXAsIGJ1ZmYgKyBpLCAgNik7CiAJcmVjb3JkLT5y
ZXRpcmVkX3BhZ2UgPSAobGU2NF90b19jcHUodG1wKSAmIDB4ZmZmZmZmZmZmZmZmKTsKLS0gCjIu
Ny40CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQt
Z2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
