Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 57C02A85F3
	for <lists+amd-gfx@lfdr.de>; Wed,  4 Sep 2019 17:09:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A029B8928F;
	Wed,  4 Sep 2019 15:09:05 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750041.outbound.protection.outlook.com [40.107.75.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54BAE8928B
 for <amd-gfx@lists.freedesktop.org>; Wed,  4 Sep 2019 15:09:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HTWalq0m3ycEWwaOK9F2g3Ct2x15NS2BOfOMmA5zuXLfILWLRDpXuWCKK2ekTx3uy2wv3ThM6iQLfG/nRflapxkczJFMML1g5hoar1UOM5hunHFuwdMtcFnCtjI6h58yGl+rLJOLi6OclSVU8+F4A0xryug1kfObf9heQPkPS2dEk8svfoxPgFhcH9LQUM6dS8xN7F6c1u9Tgnjwb1c4BFW2o2OgPw9JrtQFeR1YM98PQrEiNEEpODUgV5Nnj+40jVsqO/nAv1nluO8CPWAa+mlq0GfA+BGChpJFgPaU03hbJbvS3fZxT36oudx6+hgpZ5kVa576d9tUgkSjx6Hswg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=11aLtl9/0T0Fsx3NVrGrKxKM2UUN95rXsbEaZQ2fawY=;
 b=UrXrMW1hrXIdYC76ipxlnvPMCas4R1hvi4sAVCxqyc9SVeH2qdl/rnPNMj4udPqCpdk1s7EjXJsZDElZ40Y9Ew+zdjpMazAbBcxF4GadYjUkgn8tYuoPrbqIUuz+BYjOF9kQXZnTYNI5X7yziQQj8xfY4cQDDh+/PTLwe/FmVv9yPaU33sKLr4qOdZaVjic7LGz/Hbeekc3PIxh+oiPofOVLyyAAcjSm4JUZx6tfHKRdvsov1snZcYWQARIWrGHqEDM8lhJRgLUtsNfQO4skBELCgUUIuqViyaYLDNpWubI1d9hDI13mMziCXp7jQnMSfLhHEt80CHjuTH4UnHvQ+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from BL0PR12MB2820.namprd12.prod.outlook.com (20.177.240.11) by
 BL0PR12MB2467.namprd12.prod.outlook.com (52.132.10.149) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2199.21; Wed, 4 Sep 2019 15:09:01 +0000
Received: from BL0PR12MB2820.namprd12.prod.outlook.com
 ([fe80::c8:3c2:e70d:5163]) by BL0PR12MB2820.namprd12.prod.outlook.com
 ([fe80::c8:3c2:e70d:5163%7]) with mapi id 15.20.2241.014; Wed, 4 Sep 2019
 15:09:01 +0000
From: "Li, Roman" <Roman.Li@amd.com>
To: "Liu, Aaron" <Aaron.Liu@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH 2/2] drm/amd/display: update renoir_ip_offset.h
Thread-Topic: [PATCH 2/2] drm/amd/display: update renoir_ip_offset.h
Thread-Index: AQHVYubwXOzJD1t3FEO+IRyQZ5aa9qcbn24w
Date: Wed, 4 Sep 2019 15:09:01 +0000
Message-ID: <BL0PR12MB2820408DB471DCE9BB92B7A989B80@BL0PR12MB2820.namprd12.prod.outlook.com>
References: <1567577166-18064-1-git-send-email-aaron.liu@amd.com>
 <1567577166-18064-2-git-send-email-aaron.liu@amd.com>
In-Reply-To: <1567577166-18064-2-git-send-email-aaron.liu@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 952030b6-f7dc-4436-7256-08d73149d17a
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BL0PR12MB2467; 
x-ms-traffictypediagnostic: BL0PR12MB2467:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BL0PR12MB246715BC4375733D6315E4D389B80@BL0PR12MB2467.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:324;
x-forefront-prvs: 0150F3F97D
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(979002)(4636009)(346002)(39860400002)(396003)(366004)(376002)(136003)(13464003)(199004)(189003)(33656002)(316002)(305945005)(229853002)(6246003)(53936002)(74316002)(66066001)(110136005)(256004)(14444005)(478600001)(6116002)(52536014)(5660300002)(4326008)(71190400001)(71200400001)(81156014)(7736002)(2906002)(7696005)(76176011)(3846002)(55016002)(8676002)(66476007)(64756008)(99286004)(54906003)(6436002)(66446008)(76116006)(66946007)(66556008)(9686003)(15650500001)(102836004)(53546011)(6506007)(476003)(11346002)(446003)(2501003)(8936002)(26005)(14454004)(486006)(25786009)(86362001)(186003)(81166006)(969003)(989001)(999001)(1009001)(1019001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BL0PR12MB2467;
 H:BL0PR12MB2820.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: MdJbcQw1NpMWG0QqDCFtypcIbMT5zFG0JFSYY2AILtxJ1OB9blEtXetvIHZ7j41+8dKlQNsEYHs8nJZtj9RrUR4ZGaWBZh/ItPurc3/OU1JZ5xiKomtE+KvYxkbjKs5MxfaPvd6vXYgPacyAYrvBQKAcB1okeeqdeoOlhZGOgDll06EeQ+bqqjUTEXFxHFPTx0uL1HtLIVPEWzVDRpFCcuhqmuIfp2KWv0mOZpwIzNSc+WPmvxK9gLRB1O7Lphs50JGuonYSanezfEcyTq3Vob66aStIDY9A29QEUMe0FITYXdEO5TfsKAdJIaYjtO3KfGBrMhhVtTJ01qeqtw/JdQ9eT8HBiM/D7p89ZtZjWuJTF6GDT27QN4CLnhET/Zaiz4D1FB8MXqe6B7Dd/ur5dojEnR/B/jPmo+w1g/9s9qU=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 952030b6-f7dc-4436-7256-08d73149d17a
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Sep 2019 15:09:01.1941 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IeXBX57HusZq9wEsnZ3E/pAoQyRRqJYjG/WVQw7eMlukFKMMSBoH/Hu363e+4mSC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2467
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=11aLtl9/0T0Fsx3NVrGrKxKM2UUN95rXsbEaZQ2fawY=;
 b=DQDYqnnZSn0fkVo+W/SMtQCiZ3ReioNJ5mvFeL4U7snrKOwNoPFj694tndYi3QDuCH34ukKVJ2VZFXP5ht2NffEhHuLTtk5fIQ4EuUuzj4vuMxMaCjkP5J8didRXPHUWPSImcptk0TjJ7o6Ij6YpO6y46V12sMVyPIzk3npUR18=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Roman.Li@amd.com; 
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Huang,
 Ray" <Ray.Huang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

QWNrZWQtYnk6IFJvbWFuIExpIDxyb21hbi5saUBhbWQuY29tPgoKLS0tLS1PcmlnaW5hbCBNZXNz
YWdlLS0tLS0KRnJvbTogTGl1LCBBYXJvbiA8QWFyb24uTGl1QGFtZC5jb20+IApTZW50OiBXZWRu
ZXNkYXksIFNlcHRlbWJlciA0LCAyMDE5IDI6MDcgQU0KVG86IGFtZC1nZnhAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCkNjOiBEZXVjaGVyLCBBbGV4YW5kZXIgPEFsZXhhbmRlci5EZXVjaGVyQGFtZC5j
b20+OyBIdWFuZywgUmF5IDxSYXkuSHVhbmdAYW1kLmNvbT47IExpLCBSb21hbiA8Um9tYW4uTGlA
YW1kLmNvbT47IExpdSwgQWFyb24gPEFhcm9uLkxpdUBhbWQuY29tPgpTdWJqZWN0OiBbUEFUQ0gg
Mi8yXSBkcm0vYW1kL2Rpc3BsYXk6IHVwZGF0ZSByZW5vaXJfaXBfb2Zmc2V0LmgKClRoaXMgcGF0
Y2ggdXBkYXRlcyBNUDFfQkFTRSBpbiByZW5vaXJfaXBfb2Zmc2V0LmgKClNpZ25lZC1vZmYtYnk6
IEFhcm9uIExpdSA8YWFyb24ubGl1QGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9p
bmNsdWRlL3Jlbm9pcl9pcF9vZmZzZXQuaCB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2Vy
dGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQv
aW5jbHVkZS9yZW5vaXJfaXBfb2Zmc2V0LmggYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2luY2x1ZGUv
cmVub2lyX2lwX29mZnNldC5oCmluZGV4IDU1NDcxNGMuLjA5NDY0OGMgMTAwNjQ0Ci0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvaW5jbHVkZS9yZW5vaXJfaXBfb2Zmc2V0LmgKKysrIGIvZHJpdmVy
cy9ncHUvZHJtL2FtZC9pbmNsdWRlL3Jlbm9pcl9pcF9vZmZzZXQuaApAQCAtMTU1LDcgKzE1NSw3
IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgSVBfQkFTRSBNUDBfQkFTRSA9eyB7IHsgeyAweDAwMDE2
MDAwLCAweDAyNDNGQzAwLCAweDAwREMwMDAwCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgeyB7IDAsIDAsIDAsIDAsIDAgfSB9LAogICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIHsgeyAwLCAwLCAwLCAwLCAwIH0gfSwKICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICB7IHsgMCwgMCwgMCwgMCwgMCB9IH0gfSB9OyAtc3Rh
dGljIGNvbnN0IHN0cnVjdCBJUF9CQVNFIE1QMV9CQVNFID17IHsgeyB7IDB4MDAwMTYyMDAsIDB4
MDI0MDA0MDAsIDB4MDBFODAwMDAsIDB4MDBFQzAwMDAsIDB4MDBGMDAwMDAgfSB9LAorc3RhdGlj
IGNvbnN0IHN0cnVjdCBJUF9CQVNFIE1QMV9CQVNFID17IHsgeyB7IDB4MDAwMTYwMDAsIDB4MDI0
MDA0MDAsIAorMHgwMEU4MDAwMCwgMHgwMEVDMDAwMCwgMHgwMEYwMDAwMCB9IH0sCiAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgeyB7IDAsIDAsIDAsIDAsIDAgfSB9LAog
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHsgeyAwLCAwLCAwLCAwLCAw
IH0gfSwKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB7IHsgMCwgMCwg
MCwgMCwgMCB9IH0sCi0tCjIuNy40CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ft
ZC1nZng=
