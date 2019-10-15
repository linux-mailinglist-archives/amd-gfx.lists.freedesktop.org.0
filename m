Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 03740D8344
	for <lists+amd-gfx@lfdr.de>; Wed, 16 Oct 2019 00:08:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1BBB6E89C;
	Tue, 15 Oct 2019 22:08:12 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770045.outbound.protection.outlook.com [40.107.77.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A552F6E89B
 for <amd-gfx@lists.freedesktop.org>; Tue, 15 Oct 2019 22:08:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UkiTpLCnb11xswSd6JiihVMt4vXkuL/CHoxhAQh7VWyTIR3bgyJFaP/zUl8t9rlYKAfcw0N0qDvaoeE4/j5ip6X25cDf2bKXLiQ3RUw/0qJGiEiEtEtPQuKvyHESTsktnLwCMVqlq41bOzzgCS89KQbEIu7uEvDa/OS6y5OoPHFGsKYXV2S3Roy8UQ28fB3p9I7i+L1Y/O+rIiWuo4bbouyyFa8dUyIiwNB4luG1n1Kz/2zl4sVElE2w7GEDZw9qlY+FD4wThNUdsim1iD4SeJiRVm2V1D6M6KXhDHgLrURPfHbb3WaLOxs/7IXQLGi1NsJIWc+DEyuBlvr7V4YB0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XF6Sync7JnyWL6SP9fwKxZiz7Y0UT8z2agZdbtZlRgY=;
 b=bwU5Fanrws86/xjLOOvAZarrNgpxj/DxBG7BILi4du04pjx9Oj8751rwFTg0Hojtep4Uo6ejaaixqqmhOyd+hT9NRDhZ+WljuQuV2PCLGGmR6HF7u5CeEDy2yU9HprOq2tSpggmIEHTTP5bXN2cRTPh6EF9+kMQHg6bewsS1K0n+NRpnIIdY70fq3RIhX+gSaMjg7Jj8H2EDEU1Ev8iTiM0Jyo6lO8DbCO2s2dqT/nHsoibTapDE+Hx+jyxHJpOuIqO9OXjVslDq2EFMUzVSqQN2PGnlRpK49W81kfrj2cpz/jk101pP8XCEsx1UsHN6eiJqk5/j6v8bmpIL+hJC7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CY4PR12MB1254.namprd12.prod.outlook.com (10.168.169.17) by
 CY4PR12MB1800.namprd12.prod.outlook.com (10.175.63.18) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.17; Tue, 15 Oct 2019 22:08:07 +0000
Received: from CY4PR12MB1254.namprd12.prod.outlook.com
 ([fe80::88ff:f1df:158e:2add]) by CY4PR12MB1254.namprd12.prod.outlook.com
 ([fe80::88ff:f1df:158e:2add%11]) with mapi id 15.20.2347.023; Tue, 15 Oct
 2019 22:08:07 +0000
From: "Zhu, James" <James.Zhu@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 0/3] Fixed amdgpu resume failure from suspend
Thread-Topic: [PATCH 0/3] Fixed amdgpu resume failure from suspend
Thread-Index: AQHVg6UF8fg0DUmMHU64tO7FpBoyVw==
Date: Tue, 15 Oct 2019 22:08:06 +0000
Message-ID: <1571177279-9435-1-git-send-email-James.Zhu@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTOPR0101CA0025.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::38) To CY4PR12MB1254.namprd12.prod.outlook.com
 (2603:10b6:903:41::17)
x-originating-ip: [165.204.55.251]
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.7.4
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 213cc227-f201-4aaf-0c06-08d751bc283b
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: CY4PR12MB1800:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CY4PR12MB18007EF22BA825655CC342FCE4930@CY4PR12MB1800.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 01917B1794
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(366004)(396003)(376002)(346002)(39860400002)(189003)(199004)(8936002)(36756003)(5640700003)(81166006)(6512007)(81156014)(4326008)(2501003)(71200400001)(71190400001)(99286004)(66066001)(2616005)(486006)(14454004)(256004)(86362001)(8676002)(6306002)(50226002)(476003)(316002)(25786009)(186003)(478600001)(2351001)(2906002)(6436002)(26005)(6916009)(102836004)(6116002)(6506007)(386003)(5660300002)(64756008)(66946007)(66476007)(305945005)(966005)(52116002)(3846002)(66446008)(4744005)(6486002)(7736002)(66556008);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR12MB1800;
 H:CY4PR12MB1254.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: DznHe4MnA9myDqYYPi91zQCsI1eg2oSEBoOm9RA6opJRT3AmZ+qJmO1Z1ZZLrVnzaH2oQtx79UCsPzEsEvHjp2UHiG4HjLt+djPI1uitdx8EAZh21Jy2+jd/eh9yjZJevGev4h5MsKMpi/hn+MP3xg0dQJccWGBhPsCVN1ESv15jc70vXuFzC6CCLFcvY7K1lec5hOXPc6nn9/SJdaF9bp3UDG2firMHzHU3UPPpoLUje8UjzVLjdTU1UUvHJWJUHfLJxaINZHYlCH03dDlxBnGcwqSr5ckzLokpNhXP3jcxS1TOQFSZs+JweNcms7l2c2tGHurj6+SLBo121E01pTOtOg815rDfI8SBCzg0iFqKzXdp3izZPmpbVICnXXwuqIcr1Os3qsNrpyx+Ce/3XyvqgUA9XDtorCIVoYnNoNtbgnKPfMlhKRwtdkS9+EPClvcurHh6HZanbKaSLwcjzQ==
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 213cc227-f201-4aaf-0c06-08d751bc283b
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Oct 2019 22:08:07.0732 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FyTno+2TcRt/fgC4DU/Gy+KywT2OBZI2YMFqFIkN0l9ztUJhSNF8hI8bFJ8GHE+O
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1800
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XF6Sync7JnyWL6SP9fwKxZiz7Y0UT8z2agZdbtZlRgY=;
 b=089OE8JwqJDRR74kArvtERcsevaLUe5m5hdQVQsbFTKy/OeFd90k258UiNSeIgwLFBHZEYotPgM0wMmGoanaCFPjUXSNLRFuLLuohRrFvgo1ALyYqnU4VqShOyGw9ZlOQBhV/1csMybjtnST8DQG9vCf9okokO/Trc/pVqiOJqs=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=James.Zhu@amd.com; 
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
Cc: "Zhu, James" <James.Zhu@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

VVZEIHNlc3Npb24gaW5mbyBzaXplIGNhbiBiZSB1cHRvIDEyOEssIHdlIG5lZWQgdG8gYWxsb2Nh
dGUgYSBsYXJnZQplbm91Z2ggYnVmZmVyIGZvciB0aGUgc2Vzc2lvbiBpbmZvLCBvdGhlcndpc2Ug
dGhlIElCIHRlc3QgY2FuIG92ZXJ3cml0ZQpvdGhlcidzIG1lbW9yeS4KCkJ1ZzogaHR0cHM6Ly9i
dWd6aWxsYS5rZXJuZWwub3JnL3Nob3dfYnVnLmNnaT9pZD0yMDQyNDEKCkphbWVzIFpodSAoMyk6
CiAgZHJtL2FtZGdwdS91dmQ6QWRkIHV2ZCBlbmMgc2Vzc2lvbiBibwogIGRybS9hbWRncHUvdXZk
OkFsbG9jYXRlIGVuYyBzZXNzaW9uIGJvIGZvciB1dmQ2LjAgcmluZyBJQiB0ZXN0CiAgZHJtL2Ft
ZGdwdS91dmQ6QWxsb2NhdGUgZW5jIHNlc3Npb24gYm8gZm9yIHV2ZDcuMCByaW5nIElCIHRlc3QK
CiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdXZkLmggfCAgNCArKysrCiBkcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS91dmRfdjZfMC5jICAgfCAxNiArKysrKysrKysrKysrKy0t
CiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS91dmRfdjdfMC5jICAgfCAxNiArKysrKysrKysr
KysrKy0tCiAzIGZpbGVzIGNoYW5nZWQsIDMyIGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0p
CgotLSAKMi43LjQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
