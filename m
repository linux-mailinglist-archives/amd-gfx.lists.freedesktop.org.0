Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 88E4E7DA90
	for <lists+amd-gfx@lfdr.de>; Thu,  1 Aug 2019 13:48:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 207596E524;
	Thu,  1 Aug 2019 11:48:50 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr780049.outbound.protection.outlook.com [40.107.78.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C33E6E52E
 for <amd-gfx@lists.freedesktop.org>; Thu,  1 Aug 2019 11:48:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OXE1cNT3Gd4kUj+y0Ad407t+fGu+DD5UlYqmR4v8L6UHX/uNyeK6ylLyNyUclejgoWwpVP+cisiPZYPZmQHa9qVYKsrfJqgoC4me2cKOFGBEFTSzQDnKikpU5yUR7kQctMNBIYTXC8EEQuZ+EopJam2OUbL6yixBE2Ub6pPEHC7btpMGsTwI2WRov7xeLq7daVrs9BGI1lC/Bwl7JMLuyYTeJgLNs7JJnwmKxRM8fhPjA34Q+hwbF69fYdBnyiETNU4cfz63mSophyaGptBwocDYb3Dwfs27nZPpuaHKRJWEQYcnfNvoQ6exjdQ0U4kLBbfoqaqXsQv2hSSTsrRDVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ga8Am9F8+nuwtAO8KUk09vzCFORxiLYa9WcoPNKi5dg=;
 b=VWm8fENMdgAXybyE65587Q787n/tXRJRR3MjowZZJhHiOu9uw4NiOIt4AcfvVyF72V8EEJjD/Ywm8yzFDlMr3pn1u/Ze2iVLbwMKk4BIeuGyG23bXDhYXuiOJ89p30OJGy3fVRd4OXnG81ezpTL5tvPmq0M0HVU9PL9OX/83xm5r8v2ODgcxVsRnhSd74X1U7pko/M0PFIbMphd0Rydj+nKOP+Tv+87MCEaVy41WS+BdNJdKrneYjuycPL7v1u5mXIGNyJ8ul5sMU6evxHwc+/JGhuMmIwmOpXEtN2/b5+fj083PRVeuQhq705hZ+q5KWY3M6WADmTam2JvI2u5yzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from BN6PR12MB1618.namprd12.prod.outlook.com (10.172.21.149) by
 BN6PR12MB1890.namprd12.prod.outlook.com (10.175.101.23) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2136.13; Thu, 1 Aug 2019 11:48:46 +0000
Received: from BN6PR12MB1618.namprd12.prod.outlook.com
 ([fe80::981d:64be:c32a:40d1]) by BN6PR12MB1618.namprd12.prod.outlook.com
 ([fe80::981d:64be:c32a:40d1%3]) with mapi id 15.20.2136.010; Thu, 1 Aug 2019
 11:48:46 +0000
From: "Russell, Kent" <Kent.Russell@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 2/2] drm/amdgpu: Fix pcie_bw on Vega20
Thread-Topic: [PATCH 2/2] drm/amdgpu: Fix pcie_bw on Vega20
Thread-Index: AQHVSF8T4j0VNI4goEGp1L4oqbQvUw==
Date: Thu, 1 Aug 2019 11:48:46 +0000
Message-ID: <20190801114828.12273-2-kent.russell@amd.com>
References: <20190801114828.12273-1-kent.russell@amd.com>
In-Reply-To: <20190801114828.12273-1-kent.russell@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
x-clientproxiedby: YT1PR01CA0020.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::33)
 To BN6PR12MB1618.namprd12.prod.outlook.com
 (2603:10b6:405:b::21)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ffcd467d-a02a-48ca-4253-08d71676361d
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BN6PR12MB1890; 
x-ms-traffictypediagnostic: BN6PR12MB1890:
x-microsoft-antispam-prvs: <BN6PR12MB189001CE157A1872C4859FE485DE0@BN6PR12MB1890.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1751;
x-forefront-prvs: 01165471DB
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(376002)(39860400002)(346002)(136003)(366004)(189003)(199004)(26005)(6512007)(316002)(256004)(486006)(68736007)(6116002)(3846002)(6436002)(50226002)(25786009)(2616005)(11346002)(6486002)(476003)(478600001)(305945005)(66066001)(53936002)(14454004)(6916009)(7736002)(4326008)(446003)(71200400001)(2906002)(99286004)(86362001)(102836004)(36756003)(76176011)(386003)(6506007)(71190400001)(66556008)(64756008)(5640700003)(52116002)(66946007)(186003)(66476007)(66446008)(8936002)(1076003)(8676002)(81166006)(2351001)(5660300002)(2501003)(81156014);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1890;
 H:BN6PR12MB1618.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: ktKe6S/N9KCpBzG5YGlYc3FqQjlfeZMRyymvHkmORvicZ8Mc6nNg+V4Dhd9ABL3VkOcepbrOA3etoE4QUsOlkrnP6V7Fz/L0Ce+rg3xxZNG9IpqGuwPsdRZsOaYRVmmsIqYy3+Q6a127ldN3YGmC/coJAX6sUu7fLcQIgoO8fyh5kurPFlS1nR5vMYGAMay3uj0KqnP+UtfeIRkyY12aSnwF1LCkQJT3aNmaQA6ZLj6IB3CDAUBgY9HFSJPIKA3GEMft+QLCeN0mVzejk++UIfjizuRyuHD5pDoWxxmT2czDmWvb5B75v8qp8pXoCboc9t5D3nSYtWD6YuVKgxmHLV7GqQhVWt4VLi/qqGCozRUJYMFAmR16w4aQYDq9+hsY0jsMIDSVGQ1au2umv6JH9WNDwwQHMurUeOHVTHlNVKY=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ffcd467d-a02a-48ca-4253-08d71676361d
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Aug 2019 11:48:46.8372 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: krussell@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1890
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ga8Am9F8+nuwtAO8KUk09vzCFORxiLYa9WcoPNKi5dg=;
 b=z1vs4h/4O7jRkiG4M0JeHp375zULtU4PIecNKzeT929lLMXkMkmKsVBo+c6A4t9ZfkKOQMpQLGoDUpYtGmT0VWnZN23hniaj8Gzm8mBukNUUXi/+qnIN4aeYNKMLx+zPil/2+Nv+kbawYtLyURDYfXxxziNgZkKuuPsIngXX2Dc=
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
Cc: "Russell, Kent" <Kent.Russell@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

VGhlIHJlZ2lzdGVycyB1c2VkIGZvciBWRzIwIGFyZSBkaWZmZXJlbnQgaW4gdGhhdCBjZXJ0YWlu
IHBlcmZvcm1hbmNlCmNvdW50ZXJzIHdlcmUgc3BsaXQgb2ZmIHRvIFRYQ0xLMy80LiBWZWdhMTAv
MTIgZG9lc24ndCBoYXZlIHRoaXMsIHNvIGFkZAphIG5ldyB2ZzIwX2dldF9wY2llX3VzYWdlIHRv
IHJlZmxlY3QgdGhpcyBjaGFuZ2UuCgpDaGFuZ2UtSWQ6IEllYzRiZjYwODQxMWI0NmYwODI3ZTdm
ZmViNzRjZTkzZTFmZDNkMWI4ClNpZ25lZC1vZmYtYnk6IEtlbnQgUnVzc2VsbCA8a2VudC5ydXNz
ZWxsQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvc29jMTUuYyB8IDYw
ICsrKysrKysrKysrKysrKysrKysrKysrKysrLS0tLQogMSBmaWxlIGNoYW5nZWQsIDUyIGluc2Vy
dGlvbnMoKyksIDggZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvc29jMTUuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3NvYzE1LmMKaW5k
ZXggZGM1NTM5NzhkMjNhLi42Yjg1NDI4NzMzOTMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L3NvYzE1LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvc29j
MTUuYwpAQCAtNzg0LDE0ICs3ODQsOSBAQCBzdGF0aWMgdm9pZCBzb2MxNV9nZXRfcGNpZV91c2Fn
ZShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwgdWludDY0X3QgKmNvdW50MCwKIAogCS8qIFNl
dCB0aGUgMiBldmVudHMgdGhhdCB3ZSB3aXNoIHRvIHdhdGNoLCBkZWZpbmVkIGFib3ZlICovCiAJ
LyogUmVnIDQwIGlzICMgcmVjZWl2ZWQgbXNncyAqLworCS8qIFJlZyAxMDQgaXMgIyBvZiBwb3N0
ZWQgcmVxdWVzdHMgc2VudCAqLwogCXBlcmZjdHIgPSBSRUdfU0VUX0ZJRUxEKHBlcmZjdHIsIFBD
SUVfUEVSRl9DTlRMX1RYQ0xLLCBFVkVOVDBfU0VMLCA0MCk7Ci0JLyogUHJlLVZHMjAsIFJlZyAx
MDQgaXMgIyBvZiBwb3N0ZWQgcmVxdWVzdHMgc2VudC4gT24gVkcyMCBpdCdzIDEwOCAqLwotCWlm
IChhZGV2LT5hc2ljX3R5cGUgPT0gQ0hJUF9WRUdBMjApCi0JCXBlcmZjdHIgPSBSRUdfU0VUX0ZJ
RUxEKHBlcmZjdHIsIFBDSUVfUEVSRl9DTlRMX1RYQ0xLLAotCQkJCQlFVkVOVDFfU0VMLCAxMDgp
OwotCWVsc2UKLQkJcGVyZmN0ciA9IFJFR19TRVRfRklFTEQocGVyZmN0ciwgUENJRV9QRVJGX0NO
VExfVFhDTEssCi0JCQkJCUVWRU5UMV9TRUwsIDEwNCk7CisJcGVyZmN0ciA9IFJFR19TRVRfRklF
TEQocGVyZmN0ciwgUENJRV9QRVJGX0NOVExfVFhDTEssIEVWRU5UMV9TRUwsIDEwNCk7CiAKIAkv
KiBXcml0ZSB0byBlbmFibGUgZGVzaXJlZCBwZXJmIGNvdW50ZXJzICovCiAJV1JFRzMyX1BDSUUo
c21uUENJRV9QRVJGX0NOVExfVFhDTEssIHBlcmZjdHIpOwpAQCAtODIxLDYgKzgxNiw1NSBAQCBz
dGF0aWMgdm9pZCBzb2MxNV9nZXRfcGNpZV91c2FnZShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRl
diwgdWludDY0X3QgKmNvdW50MCwKIAkqY291bnQxID0gUlJFRzMyX1BDSUUoc21uUENJRV9QRVJG
X0NPVU5UMV9UWENMSykgfCAoY250MV9vZiA8PCAzMik7CiB9CiAKK3N0YXRpYyB2b2lkIHZlZ2Ey
MF9nZXRfcGNpZV91c2FnZShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwgdWludDY0X3QgKmNv
dW50MCwKKwkJCQkgdWludDY0X3QgKmNvdW50MSkKK3sKKwl1aW50MzJfdCBwZXJmY3RyID0gMDsK
Kwl1aW50NjRfdCBjbnQwX29mLCBjbnQxX29mOworCWludCB0bXA7CisKKwkvKiBUaGlzIHJlcG9y
dHMgMCBvbiBBUFVzLCBzbyByZXR1cm4gdG8gYXZvaWQgd3JpdGluZy9yZWFkaW5nIHJlZ2lzdGVy
cworCSAqIHRoYXQgbWF5IG9yIG1heSBub3QgYmUgZGlmZmVyZW50IGZyb20gdGhlaXIgR1BVIGNv
dW50ZXJwYXJ0cworCSAqLworCWlmIChhZGV2LT5mbGFncyAmIEFNRF9JU19BUFUpCisJCXJldHVy
bjsKKworCS8qIFNldCB0aGUgMiBldmVudHMgdGhhdCB3ZSB3aXNoIHRvIHdhdGNoLCBkZWZpbmVk
IGFib3ZlICovCisJLyogUmVnIDQwIGlzICMgcmVjZWl2ZWQgbXNncyAqLworCS8qIFJlZyAxMDgg
aXMgIyBvZiBwb3N0ZWQgcmVxdWVzdHMgc2VudCBvbiBWRzIwICovCisJcGVyZmN0ciA9IFJFR19T
RVRfRklFTEQocGVyZmN0ciwgUENJRV9QRVJGX0NOVExfVFhDTEszLAorCQkJCUVWRU5UMF9TRUws
IDQwKTsKKwlwZXJmY3RyID0gUkVHX1NFVF9GSUVMRChwZXJmY3RyLCBQQ0lFX1BFUkZfQ05UTF9U
WENMSzMsCisJCQkJRVZFTlQxX1NFTCwgMTA4KTsKKworCS8qIFdyaXRlIHRvIGVuYWJsZSBkZXNp
cmVkIHBlcmYgY291bnRlcnMgKi8KKwlXUkVHMzJfUENJRShzbW5QQ0lFX1BFUkZfQ05UTF9UWENM
SzMsIHBlcmZjdHIpOworCS8qIFplcm8gb3V0IGFuZCBlbmFibGUgdGhlIHBlcmYgY291bnRlcnMK
KwkgKiBXcml0ZSAweDU6CisJICogQml0IDAgPSBTdGFydCBhbGwgY291bnRlcnMoMSkKKwkgKiBC
aXQgMiA9IEdsb2JhbCBjb3VudGVyIHJlc2V0IGVuYWJsZSgxKQorCSAqLworCVdSRUczMl9QQ0lF
KHNtblBDSUVfUEVSRl9DT1VOVF9DTlRMLCAweDAwMDAwMDA1KTsKKworCW1zbGVlcCgxMDAwKTsK
KworCS8qIExvYWQgdGhlIHNoYWRvdyBhbmQgZGlzYWJsZSB0aGUgcGVyZiBjb3VudGVycworCSAq
IFdyaXRlIDB4MjoKKwkgKiBCaXQgMCA9IFN0b3AgY291bnRlcnMoMCkKKwkgKiBCaXQgMSA9IExv
YWQgdGhlIHNoYWRvdyBjb3VudGVycygxKQorCSAqLworCVdSRUczMl9QQ0lFKHNtblBDSUVfUEVS
Rl9DT1VOVF9DTlRMLCAweDAwMDAwMDAyKTsKKworCS8qIFJlYWQgcmVnaXN0ZXIgdmFsdWVzIHRv
IGdldCBhbnkgPjMyYml0IG92ZXJmbG93ICovCisJdG1wID0gUlJFRzMyX1BDSUUoc21uUENJRV9Q
RVJGX0NOVExfVFhDTEszKTsKKwljbnQwX29mID0gUkVHX0dFVF9GSUVMRCh0bXAsIFBDSUVfUEVS
Rl9DTlRMX1RYQ0xLMywgQ09VTlRFUjBfVVBQRVIpOworCWNudDFfb2YgPSBSRUdfR0VUX0ZJRUxE
KHRtcCwgUENJRV9QRVJGX0NOVExfVFhDTEszLCBDT1VOVEVSMV9VUFBFUik7CisKKwkvKiBHZXQg
dGhlIHZhbHVlcyBhbmQgYWRkIHRoZSBvdmVyZmxvdyAqLworCSpjb3VudDAgPSBSUkVHMzJfUENJ
RShzbW5QQ0lFX1BFUkZfQ09VTlQwX1RYQ0xLMykgfCAoY250MF9vZiA8PCAzMik7CisJKmNvdW50
MSA9IFJSRUczMl9QQ0lFKHNtblBDSUVfUEVSRl9DT1VOVDFfVFhDTEszKSB8IChjbnQxX29mIDw8
IDMyKTsKK30KKwogc3RhdGljIGJvb2wgc29jMTVfbmVlZF9yZXNldF9vbl9pbml0KHN0cnVjdCBh
bWRncHVfZGV2aWNlICphZGV2KQogewogCXUzMiBzb2xfcmVnOwpAQCAtODkyLDcgKzkzNiw3IEBA
IHN0YXRpYyBjb25zdCBzdHJ1Y3QgYW1kZ3B1X2FzaWNfZnVuY3MgdmVnYTIwX2FzaWNfZnVuY3Mg
PQogCS5pbnZhbGlkYXRlX2hkcCA9ICZzb2MxNV9pbnZhbGlkYXRlX2hkcCwKIAkubmVlZF9mdWxs
X3Jlc2V0ID0gJnNvYzE1X25lZWRfZnVsbF9yZXNldCwKIAkuaW5pdF9kb29yYmVsbF9pbmRleCA9
ICZ2ZWdhMjBfZG9vcmJlbGxfaW5kZXhfaW5pdCwKLQkuZ2V0X3BjaWVfdXNhZ2UgPSAmc29jMTVf
Z2V0X3BjaWVfdXNhZ2UsCisJLmdldF9wY2llX3VzYWdlID0gJnZlZ2EyMF9nZXRfcGNpZV91c2Fn
ZSwKIAkubmVlZF9yZXNldF9vbl9pbml0ID0gJnNvYzE1X25lZWRfcmVzZXRfb25faW5pdCwKIAku
Z2V0X3BjaWVfcmVwbGF5X2NvdW50ID0gJnNvYzE1X2dldF9wY2llX3JlcGxheV9jb3VudCwKIH07
Ci0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
