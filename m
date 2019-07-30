Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C4447A3BC
	for <lists+amd-gfx@lfdr.de>; Tue, 30 Jul 2019 11:14:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9233F6E451;
	Tue, 30 Jul 2019 09:14:25 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750085.outbound.protection.outlook.com [40.107.75.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D287E6E451
 for <amd-gfx@lists.freedesktop.org>; Tue, 30 Jul 2019 09:14:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QvQkawtU9MJRV4gOcZpPQGYbMB4RS3Go029OIStsiVCHBKkc1WyRA+BxZYG0fgELnHvO29xcfOn4pg0tw0iFS6zxG26Sjl0AtsKlhsHZ1EbClbKtjogc+eGRKqHco6a8BO2mu3EY3HLh7H3dPT5utmn2TunrYlthPLXMQQTWu1Sd/LFxG1ZMTgjwuCxH2761ifAXZuv93EuZRsbZ1pnw4nb3xj8FUv780CajPCHK6hsNsPlttShgkNf1qeJkgUq5oVImNYRvrpktqeBGBPIioNu9D7CAkWNjyPWTr4mAO+KkopUw37vdeDqO4T/aSCzdV//UShDOWLfFUT+MOHQFVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qsDT73QTXQ7z4hRn5yCpeqp+e/+dRSXoJ+umMhdkYzM=;
 b=O36PDZEHOV8mI1VPcGdMLGba+Z+XpI9cEZu4IC5O6fGRb6CmT6xDfR+H+LZmpkPS9766mNFGWIHpDZX0rfhEJ7wVCA4oD/uKn2t9Q8obxwBj3nzzP4+r99FMXEjlp/PabozdyfZ8hcRbcqRXdue22sKApO82xvsUmUFWPOSI9onVMo40r9il3hy1KiBrUfLqTTOeMkjCN+3L1zpLjnwr+1e1a+FG7ZvXuDML6p3u5cBakL1YBD0/3ZAjKCAwEYgwtP8Fydy3DOun6sXQmzPs3LentZ3mFapgdC1fixOOCEJpaHFZtQYpKKEcvASFxxIVwyvjUsyX7vpZK1IQ+zblMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com
 smtp.mailfrom=amd.com;dmarc=permerror action=none
 header.from=amd.com;dkim=none (message not signed);arc=none
Received: from MWHPR1201CA0007.namprd12.prod.outlook.com
 (2603:10b6:301:4a::17) by DM6PR12MB3516.namprd12.prod.outlook.com
 (2603:10b6:5:18a::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2115.13; Tue, 30 Jul
 2019 09:14:21 +0000
Received: from BY2NAM03FT059.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::208) by MWHPR1201CA0007.outlook.office365.com
 (2603:10b6:301:4a::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2115.15 via Frontend
 Transport; Tue, 30 Jul 2019 09:14:21 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 BY2NAM03FT059.mail.protection.outlook.com (10.152.85.111) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2115.10 via Frontend Transport; Tue, 30 Jul 2019 09:14:21 +0000
Received: from [10.65.99.155] (10.34.1.3) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server (TLS) id 14.3.389.1; Tue, 30 Jul
 2019 04:14:19 -0500
Subject: Re: amdgpf: BUG: NULL pointer dereference and memory leak
To: "Koenig, Christian" <Christian.Koenig@amd.com>, =?UTF-8?B?5Lq/5LiA?=
 <teroincn@gmail.com>, "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 "Zhou, David(ChunMing)" <David1.Zhou@amd.com>
References: <CANTwqXBS5RohKsRWmfPDVxSEwri=XhuZVAmPAwdJibJODxcobA@mail.gmail.com>
 <e929562a-96fd-88c8-1b60-f1c863872db8@amd.com>
From: zhoucm1 <zhoucm1@amd.com>
Message-ID: <0952fbf6-e877-957c-f560-8ebf8d8f75ca@amd.com>
Date: Tue, 30 Jul 2019 17:14:10 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <e929562a-96fd-88c8-1b60-f1c863872db8@amd.com>
Content-Language: en-US
X-Originating-IP: [10.34.1.3]
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(396003)(39860400002)(376002)(136003)(2980300002)(428003)(53754006)(51914003)(199004)(189003)(2906002)(36756003)(5660300002)(126002)(426003)(476003)(6636002)(64126003)(229853002)(316002)(16526019)(6666004)(356004)(336012)(486006)(65826007)(2616005)(76176011)(446003)(11346002)(68736007)(58126008)(110136005)(23676004)(31696002)(186003)(305945005)(7736002)(478600001)(16576012)(67846002)(70206006)(70586007)(8676002)(65806001)(81166006)(3846002)(6116002)(8936002)(65956001)(81156014)(53936002)(14444005)(26005)(4326008)(2486003)(47776003)(6246003)(31686004)(50466002)(2870700001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3516; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a67317dc-c03b-425d-5cd1-08d714ce4eba
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:DM6PR12MB3516; 
X-MS-TrafficTypeDiagnostic: DM6PR12MB3516:
X-Microsoft-Antispam-PRVS: <DM6PR12MB3516B346A0CB86246D70333DB4DC0@DM6PR12MB3516.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1728;
X-Forefront-PRVS: 0114FF88F6
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: xUMBP8IXrGUFobUaMBJ57op45uDpiuwxg2TyRw4+dT0pzE73a0wwZFp9S35ikpixY2qcL97syvS20BJKdrEMCgdQH5w0byzy+9l+c6dL1ES1UbivIGmUQKiHTakpPBLDlfgwBOVu468GCqkJ7PDiAO+Bkzahx3+d2oOvQY3sgXw9XxVVnlCf4EhVnyYVt76aBXbfQ5Wh/WLWBnTRniOoyNPiOH9LKOVcvMESWr6f1a2j3RHJdvHS4PicMx3G7uxojBbzzR858M9ZDCLwGGVTiCCLusohsPbJDuNLCbWFXbMDppX5cOBNjn88WpdHk0k7IVFvEzq0aep4bVvEe8NWLTglgwbAzhgIiHQ6bpQ43gr+YzKO8qBMhl0fx7Fjo8XknL5GVwxL8HDE3sYA7e959g/i4lTp9f3UcRNp+be2c+E=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2019 09:14:21.1378 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a67317dc-c03b-425d-5cd1-08d714ce4eba
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3516
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qsDT73QTXQ7z4hRn5yCpeqp+e/+dRSXoJ+umMhdkYzM=;
 b=DW+b8Vx7vSgIcL2AFbCS2UWzoWNFIh6bYlrL0c+CE7ILVpdlm7t1GRCIofAbRfp5qLEHB6iQza89Z4dbUeDOYWuRQI5sl0SSLLMsZ8KhR30TnXGyvwboBhseOcQAAdZqA21oh4qTxeUys15I66i0VHJpeqTc562z5SwMzrGOxyw=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is
 165.204.84.17)
 smtp.mailfrom=amd.com; gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=permerror action=none header.from=amd.com;
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
Cc: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

CgpPbiAyMDE55bm0MDfmnIgzMOaXpSAxNzowNCwgS29lbmlnLCBDaHJpc3RpYW4gd3JvdGU6Cj4g
QW0gMzAuMDcuMTkgdW0gMTA6NDcgc2NocmllYiDkur/kuIA6Cj4+IEhpICBhbGxsLAo+PiAgICAg
ICAgICAgIFdoaWxlIGFuYWx5emluZyB0aGUgc291cmNlIGNvZGUsIEkgbm90aWNlIHRoYXQgZnVu
Y3Rpb24KPj4gYW1kZ3B1X2NzX3Byb2Nlc3NfZmVuY2VfZGVwKCkgbWF5IGV4aXN0IE5VTEwgcG9p
bnRlciBkZXJlZmVyZW5jZSBhbmQKPj4gbWVtb3J5IGxlYWsgaW4gdGhlIGZvbGxvd2luZyBjb2Rl
IGZyYWdtZW50czoKPj4KPj4KPj4gZmVuY2UgPSBhbWRncHVfY3R4X2dldF9mZW5jZShjdHgsIGVu
dGl0eSwKPj4gICAgICAgZGVwc1tpXS5oYW5kbGUpOwo+Pgo+PiBpZiAoY2h1bmstPmNodW5rX2lk
ID09IEFNREdQVV9DSFVOS19JRF9TQ0hFRFVMRURfREVQRU5ERU5DSUVTKSB7Cj4+ICAgICAgICAg
ICBzdHJ1Y3QgZHJtX3NjaGVkX2ZlbmNlICpzX2ZlbmNlID0gdG9fZHJtX3NjaGVkX2ZlbmNlKGZl
bmNlKTsKPj4gICAgICAgICAgIHN0cnVjdCBkbWFfZmVuY2UgKm9sZCA9IGZlbmNlOwo+Pgo+PiAg
ICAgICAgICAgZmVuY2UgPSBkbWFfZmVuY2VfZ2V0KCZzX2ZlbmNlLT5zY2hlZHVsZWQpOwo+PiAg
ICAgICAgICAgZG1hX2ZlbmNlX3B1dChvbGQpOwo+PiB9Cj4+Cj4+IGlmIChJU19FUlIoZmVuY2Up
KSB7Cj4+ICAgICAgICAgICAgciA9IFBUUl9FUlIoZmVuY2UpOwo+PiAgICAgICAgICAgIGFtZGdw
dV9jdHhfcHV0KGN0eCk7Cj4+ICAgICAgICAgICAgcmV0dXJuIHI7Cj4+ICAgICB9IGVsc2UgaWYg
KGZlbmNlKSB7Cj4+ICAgICAgICAgICAgIHIgPSBhbWRncHVfc3luY19mZW5jZShwLT5hZGV2LCAm
cC0+am9iLT5zeW5jLCBmZW5jZSwKPj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgdHJ1ZSk7Cj4+ICAgICAgICAgICAgIGRtYV9mZW5jZV9wdXQoZmVu
Y2UpOwo+PiAgICAgICAgICAgICAgYW1kZ3B1X2N0eF9wdXQoY3R4KTsKPj4gICAgICAgICAgICAg
IGlmIChyKQo+PiAgICAgICAgICAgICAgcmV0dXJuIHI7Cj4+ICAgICAgICAgICAgICB9Cj4+Cj4+
IGZ1bmN0aW9uIGFtZGdwdV9jdHhfZ2V0X2ZlbmNlIG1heSByZXR1cm4gTlVMTCBwb2ludGVyLCAg
d2hpY2ggd2lsbAo+PiBjYXVzZSBOVUxMIHBvaW50ZXIgZGVyZWZlcmVuY2UuIFdoYXQncyBtb3Jl
LCAgSVNfRVJSKCkgd291bGQgbm90Cj4+IHJldHVybiB0cnVlIHdoZW4gcG9pbnRlciBpcyBOVUxM
LCAgd2hpY2ggd2lsbCBjYXVzZSB0aGUgY3R4IHJlZmVyZW5jZQo+PiBsZWFrZWQuCj4gVGhhdCBo
YW5kbGluZyBpcyBhY3R1YWxseSBjb3JyZWN0Lgo+Cj4gVGhlIHByb2JsZW0gaXMgdGhlICJpZiAo
Y2h1bmstPmNodW5rX2lkID09Cj4gQU1ER1BVX0NIVU5LX0lEX1NDSEVEVUxFRF9ERVBFTkRFTkNJ
RVMpIiBzdHVmZiBhYm92ZS4KPgo+IFRoYXQgY29tZXMgdG8gZWFybHkgYW5kIG5lZWRzIHRvIGJl
IG1vdmVkIGJlbG93IGNoZWNraW5nIHRoZSBmZW5jZSBmb3IKPiBlcnJvcnMuIEdvaW5nIHRvIHNl
bmQgYSBmaXggZm9yIHRoaXMgdG8gdGhlIG1haWxpbmcgbGlzdCBpbiBhIG1pbnV0ZS4KTGluIFlp
IGlzIHJpZ2h0IEkgdGhpbmssIHdlIGxlYWtlZCBjdHggcmVmZXJlbmNlIHdoZW4gZmVuY2UgaXMg
TlVMTC4KCi1EYXZpZAo+Cj4gVGhhbmtzIGZvciB0aGUgbm90aWNlLAo+IENocmlzdGlhbi4KPgo+
PiBCdXQgSSBkb24ndCBrbm93IGhvdyB0byBmaXggaXQsIHNvIHJlcG9ydCBpdCB0byB5b3UgYWxs
Lgo+Pgo+PiBCZXN0IFJlZ2FyZHMuCj4+IExpbiBZaS4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vYW1kLWdmeA==
