Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8599B14D98F
	for <lists+amd-gfx@lfdr.de>; Thu, 30 Jan 2020 12:15:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AD5E6E7F1;
	Thu, 30 Jan 2020 11:15:40 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2073.outbound.protection.outlook.com [40.107.244.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1D906E7F1
 for <amd-gfx@lists.freedesktop.org>; Thu, 30 Jan 2020 11:15:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mhp+8h1yUY7srHk88yM2MGQl91vAnx+tNUqKukIXebcnesBE2JYvZQsgTdF8APii2Iny3SopNDyjLW1oxupx2d4v8CskHJdY1ezdhSXknPnFWthp5W4bPPl/1AW7FMOkvf651W1mLXE1Gamr5EwrfYbT23018zFC6EaSOx2ocWKW7xQAYOK4kVdv6yUQ8stBsqGPNaO0/BMgkVmHUw9vbeA74Zmwba/dabMMbWc8KGezs8LnfBL7pUtf2VTaO2uJ1/1jgN/FPXgvJLz5576l8qtMciyE7tSYpnt/CzMw8qtdeqj72207sL74Uz2OiCY7KGkf5/zN1hQRxJfGwNJTmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g8cHnfVCvDWphdHrbVA+agZIytsRAuHWpJQADl9538I=;
 b=Op49N0DQvXDf7RrFyyiMCAWU+lyP5r0XO3SdtE2H/d3XIiSIpwW9iXPnc4BXYktigm9veHEmNwmtIUxRt8a0hE0ufxT4kxlkkIdlMfsxwhL5vc1Dnp4HbVBrMQ1q0zdB68/eyeMyridHImpcUPMRappf/hmYOWzhzhiAPUrBT2qb+9JOyAXl4Ix4HOFjks1V8Y3PQgulQbi/8hzlzYpPZDMsEVDeD3YpJne7RDLtaFlF3DiTjPqrbMsYVDrgOeg3L2bnI4G4QtumtAuWWdjFDBuYr9sPLJsggP2Y9w6953uLDs74MGVfPfIAMGLtC5i0Z0DGhCDzA7g3j648XNVgWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g8cHnfVCvDWphdHrbVA+agZIytsRAuHWpJQADl9538I=;
 b=mG0BYctmohwMLrY5JZIj92skFcJ/WKOKE7rDrFeMLr6wzYcbiSoSN2yrFz8K0wPRvbIzda122ioBLv6oK2WtnpXwN/UPpiHL4tPs/Bfq0xyRlstyZkSkgssuW7oFyolilanFZvVkkxPrjB7JIhEMH291AKWyymnpAtFJD48qCw0=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Pierre-eric.Pelloux-prayer@amd.com; 
Received: from DM5PR12MB2424.namprd12.prod.outlook.com (52.132.142.162) by
 DM5PR12MB1819.namprd12.prod.outlook.com (10.175.91.148) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2665.24; Thu, 30 Jan 2020 11:15:37 +0000
Received: from DM5PR12MB2424.namprd12.prod.outlook.com
 ([fe80::348e:1791:39f7:fb1]) by DM5PR12MB2424.namprd12.prod.outlook.com
 ([fe80::348e:1791:39f7:fb1%7]) with mapi id 15.20.2665.027; Thu, 30 Jan 2020
 11:15:37 +0000
Subject: Re: [PATCH 1/2] drm/amdgpu: enable GPU reset by default on Navi
To: Alex Deucher <alexdeucher@gmail.com>, amd-gfx@lists.freedesktop.org
References: <20200127193757.28379-1-alexander.deucher@amd.com>
From: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
Message-ID: <1fc3757d-0499-a9bc-b2a9-c61eb85bcf8d@amd.com>
Date: Thu, 30 Jan 2020 12:15:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
In-Reply-To: <20200127193757.28379-1-alexander.deucher@amd.com>
Content-Type: multipart/mixed; boundary="------------CC23C746D24377BE4EF3517B"
Content-Language: fr
X-ClientProxiedBy: PR0P264CA0081.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:18::21) To DM5PR12MB2424.namprd12.prod.outlook.com
 (2603:10b6:4:b7::34)
MIME-Version: 1.0
Received: from [192.168.100.218] (109.190.135.109) by
 PR0P264CA0081.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:18::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2665.21 via Frontend Transport; Thu, 30 Jan 2020 11:15:36 +0000
X-Originating-IP: [109.190.135.109]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 0c8d860d-5122-4b7c-9f5d-08d7a575bb73
X-MS-TrafficTypeDiagnostic: DM5PR12MB1819:|DM5PR12MB1819:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR12MB181903E11685DC562EAACB0B8D040@DM5PR12MB1819.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:73;
X-Forefront-PRVS: 02981BE340
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(366004)(346002)(396003)(136003)(39860400002)(189003)(199004)(36756003)(21480400003)(5660300002)(31696002)(86362001)(33964004)(66616009)(16576012)(235185007)(66946007)(4326008)(66476007)(66556008)(316002)(8676002)(6666004)(81156014)(81166006)(31686004)(6486002)(8936002)(45080400002)(2906002)(53546011)(55236004)(52116002)(186003)(16526019)(956004)(2616005)(478600001)(26005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1819;
 H:DM5PR12MB2424.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 96nKP3YeBlvKmcZsU9LI6IJX5JFCux02h6rnz7UEjpXcWBMMaU5/v0ACu6yZnswgZ315jwAO26t0M6RJBy+JK8qX6maKtyTCfX21B05v8bOZ574N34pxxv6Oey9euYwpQ0pwVPYbplOc7LS4y4a/XxXRmDxnTDe15EY/pn5WDx8kqtZV5WoxBnvD+tz0jGJRjZJWOncL8pt8hfCPRxX+pjxzqYi+0RcMk5FD8m6YltuKUmdBnWnXB03PB1xPlIsXsNQaWF6ApKRNs//dv5U7v9VleKVCMdAMeKiYGKlHg3TCkWSu+LhI3BGNfH21bvjkR9InFnOyevN8SNTxwv34Ijuy0etB2JBU4qeTRoLZB4dnczUK1EHMNowmRX4mBqjzVJuttcfh9JXicLKIFpt67U/aeL3rWHjX0zr8beKQf9hyvennWiug1PZm/NzBXy9T
X-MS-Exchange-AntiSpam-MessageData: 2MnNBdfbhl4Ms4Cn8E2/cN40m3WByHYpu3/DqWdmG7va9nk8OeTPQyu7HT8keYP3bGo/FGnX/ssPbP1VxgBeCDnb8GqgfqjDy+toLO1Q3vRg1Y+kHO1oR86zBXT8ixZvsAgkRbfGthOrcQQG9R67aw==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c8d860d-5122-4b7c-9f5d-08d7a575bb73
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2020 11:15:37.3516 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TfN+ncYBBMGp7iVCaaSreb7aDKT4PupXnhLoosje33pSDsiDg1ew3TbbVTeehRl2qSE0NfzZ7kzxnJnx21FaDw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1819
X-BeenThere: amd-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion list for AMD gfx <amd-gfx.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/amd-gfx>
List-Post: <mailto:amd-gfx@lists.freedesktop.org>
List-Help: <mailto:amd-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=subscribe>
Cc: Alex Deucher <alexander.deucher@amd.com>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--------------CC23C746D24377BE4EF3517B
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: base64

SGkgQWxleCwNCg0KSSBoYWQgb25lIGlzc3VlIHdoaWxlIHRlc3RpbmcgdGhpcyBwYXRjaCBvbiBh
IFJYNTcwMC4NCg0KQWZ0ZXIgYSBnZnggaGFuZyBhIHJlc2V0IGlzIGV4ZWN1dGVkLg0KU3dpdGNo
aW5nIHRvIGEgVlQgYW5kIHJlc3RhcnRpbmcgZ2RtIHdvcmtzIGZpbmUgYnV0IHRoZSBjbG9ja3Mg
c2VlbSBtZXNzZWQgdXA6DQogICAtIGxvdHMgb2YgZ3JhcGhpY2FsIGFydGlmY2F0cyAodW5kZXJm
bG93cz8pDQogICAtIHBwX2RwbV9zY2xrIGFuZCBwcF9kcG1fc29jY2xrIGhhdmUgc3RyYW5nZSB2
YWx1ZXMgKHNlZSBhdHRhY2hlZCBmaWxlcykNCg0KZG1lc2cgb3V0cHV0IChmcm9tIHRoZSBnZngg
aGFuZyk6DQpbICAxNjkuNzU1MDcxXSBbZHJtOmFtZGdwdV9kbV9hdG9taWNfY29tbWl0X3RhaWwg
W2FtZGdwdV1dICpFUlJPUiogV2FpdGluZyBmb3IgZmVuY2VzIHRpbWVkIG91dCENClsgIDE2OS43
NTUxNzNdIFtkcm06YW1kZ3B1X2RtX2F0b21pY19jb21taXRfdGFpbCBbYW1kZ3B1XV0gKkVSUk9S
KiBXYWl0aW5nIGZvciBmZW5jZXMgdGltZWQgb3V0IQ0KWyAgMTc0Ljg3NDg0N10gW2RybTphbWRn
cHVfam9iX3RpbWVkb3V0IFthbWRncHVdXSAqRVJST1IqIHJpbmcgZ2Z4XzAuMC4wIHRpbWVvdXQs
IHNpZ25hbGVkIHNlcT0xMDAzNCwgZW1pdHRlZCBzZXE9MTAwMzYNClsgIDE3NC44NzQ5MjVdIFtk
cm06YW1kZ3B1X2pvYl90aW1lZG91dCBbYW1kZ3B1XV0gKkVSUk9SKiBQcm9jZXNzIGluZm9ybWF0
aW9uOiBwcm9jZXNzIGdub21lLXNoZWxsIHBpZCAxNzI0IHRocmVhZCBnbm9tZS1zaGVsOmNzMCBw
aWQgMTc0MQ0KWyAgMTc0Ljg3NDkzM10gYW1kZ3B1IDAwMDA6MGI6MDAuMDogR1BVIHJlc2V0IGJl
Z2luIQ0KWyAgMTc0Ljg3NTE5Ml0gLS0tLS0tLS0tLS0tWyBjdXQgaGVyZSBdLS0tLS0tLS0tLS0t
DQpbICAxNzQuODc1MjgyXSBXQVJOSU5HOiBDUFU6IDAgUElEOiA3IGF0IGRyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1Ly4uL2Rpc3BsYXkvZGMvZGNuMjAvZGNuMjBfcmVzb3VyY2UuYzoyOTY5IGRj
bjIwX3ZhbGlkYXRlX2JhbmR3aWR0aCsweDg3LzB4ZTAgW2FtZGdwdV0NClsgIDE3NC44NzUyODNd
IE1vZHVsZXMgbGlua2VkIGluOiBiaW5mbXRfbWlzYyhFKSBubHNfYXNjaWkoRSkgbmxzX2NwNDM3
KEUpIHZmYXQoRSkgZmF0KEUpIHNuZF9oZGFfY29kZWNfcmVhbHRlayhFKSBzbmRfaGRhX2NvZGVj
X2dlbmVyaWMoRSkgbGVkdHJpZ19hdWRpbyhFKSBzbmRfaGRhX2NvZGVjX2hkbWkoRSkgc25kX2hk
YV9pbnRlbChFKSBzbmRfaW50ZWxfbmhsdChFKSBzbmRfaGRhX2NvZGVjKEUpIHNuZF9od2RlcChF
KSBlZmlfcHN0b3JlKEUpIHNuZF9oZGFfY29yZShFKSBzbmRfcGNtKEUpIHNuZF90aW1lcihFKSBz
bmQoRSkgY2NwKEUpIHhwYWQoRSkgd21pX2Jtb2YoRSkgbXhtX3dtaShFKSBldmRldihFKSBqb3lk
ZXYoRSkgZmZfbWVtbGVzcyhFKSBlZml2YXJzKEUpIHNvdW5kY29yZShFKSBwY3Nwa3IoRSkgazEw
dGVtcChFKSBzcDUxMDBfdGNvKEUpIHJuZ19jb3JlKEUpIHNnKEUpIHdtaShFKSBidXR0b24oRSkg
YWNwaV9jcHVmcmVxKEUpIHVpbnB1dChFKSBwYXJwb3J0X3BjKEUpIHBwZGV2KEUpIGxwKEUpIHBh
cnBvcnQoRSkgZWZpdmFyZnMoRSkgaXBfdGFibGVzKEUpIGF1dG9mczQoRSkgZXh0NChFKSBjcmMz
MmNfZ2VuZXJpYyhFKSBjcmMxNihFKSBtYmNhY2hlKEUpIGpiZDIoRSkgZG1fY3J5cHQoRSkgZG1f
bW9kKEUpIGhpZF9nZW5lcmljKEUpIHVzYmhpZChFKSBoaWQoRSkgc2RfbW9kKEUpIGNyY3QxMGRp
Zl9wY2xtdWwoRSkgY3JjMzJfcGNsbXVsKEUpIGNyYzMyY19pbnRlbChFKSBnaGFzaF9jbG11bG5p
X2ludGVsKEUpIGFtZGdwdShFKSBncHVfc2NoZWQoRSkgdHRtKEUpIGRybV9rbXNfaGVscGVyKEUp
IGFlc25pX2ludGVsKEUpIGdsdWVfaGVscGVyKEUpIHhoY2lfcGNpKEUpIGFoY2koRSkgY3J5cHRv
X3NpbWQoRSkgbGliYWhjaShFKSBjcnlwdGQoRSkgZHJtKEUpIHhoY2lfaGNkKEUpIGkyY19waWl4
NChFKSBsaWJhdGEoRSkgaWdiKEUpIHVzYmNvcmUoRSkgc2NzaV9tb2QoRSkgZGNhKEUpIGkyY19h
bGdvX2JpdChFKSBncGlvX2FtZHB0KEUpDQpbICAxNzQuODc1MzEwXSAgZ3Bpb19nZW5lcmljKEUp
DQpbICAxNzQuODc1MzEzXSBDUFU6IDAgUElEOiA3IENvbW06IGt3b3JrZXIvMDoxIFRhaW50ZWQ6
IEcgICAgICAgICAgICBFICAgICA1LjQuMC1yYzctMDI2NzktZzlkNjY0ZDkxNGYwZSAjMTANClsg
IDE3NC44NzUzMTRdIEhhcmR3YXJlIG5hbWU6IEdpZ2FieXRlIFRlY2hub2xvZ3kgQ28uLCBMdGQu
IFg0NzAgQU9SVVMgVUxUUkEgR0FNSU5HL1g0NzAgQU9SVVMgVUxUUkEgR0FNSU5HLUNGLCBCSU9T
IEY2IDAxLzI1LzIwMTkNClsgIDE3NC44NzUzMThdIFdvcmtxdWV1ZTogZXZlbnRzIGRybV9zY2hl
ZF9qb2JfdGltZWRvdXQgW2dwdV9zY2hlZF0NClsgIDE3NC44NzU0MDRdIFJJUDogMDAxMDpkY24y
MF92YWxpZGF0ZV9iYW5kd2lkdGgrMHg4Ny8weGUwIFthbWRncHVdDQpbICAxNzQuODc1NDA2XSBD
b2RlOiAyZCA0NCAyMiBhNSBlOCAxZCAwMCAwMCA3NSAyNiBmMiAwZiAxMSA4NSBhOCAyMSAwMCAw
MCAzMSBkMiA0OCA4OSBlZSA0YyA4OSBlZiBlOCBkNCBmNSBmZiBmZiA0MSA4OSBjNCAyMiA4NSBl
OCAxZCAwMCAwMCA3NSA0YSA8MGY+IDBiIGViIDAyIDc1IGQxIGYyIDBmIDEwIDE0IDI0IGYyIDBm
IDExIDk1IGE4IDIxIDAwIDAwIGU4IGYxIDRiDQpbICAxNzQuODc1NDA3XSBSU1A6IDAwMTg6ZmZm
ZmE4Nzg4MDA2N2E5MCBFRkxBR1M6IDAwMDEwMjQ2DQpbICAxNzQuODc1NDA4XSBSQVg6IDAwMDAw
MDAwMDAwMDAwMDAgUkJYOiAwMDAwMDAwMDAwMDAwMDAwIFJDWDogMDAwMDAwMDAwMDAwMWU2MQ0K
WyAgMTc0Ljg3NTQwOV0gUkRYOiAwMDAwMDAwMDAwMDAxZTYwIFJTSTogZmZmZjk4MWYzZWMyZDg4
MCBSREk6IDAwMDAwMDAwMDAwMmQ4ODANClsgIDE3NC44NzU0MDldIFJCUDogZmZmZjk4MWYyNWE2
MDAwMCBSMDg6IDAwMDAwMDAwMDAwMDAwMDYgUjA5OiAwMDAwMDAwMDAwMDAwMDAwDQpbICAxNzQu
ODc1NDEwXSBSMTA6IDAwMDAwMDAxMDAwMDAwMDAgUjExOiAwMDAwMDAwMTAwMDAwMDAxIFIxMjog
MDAwMDAwMDAwMDAwMDAwMQ0KWyAgMTc0Ljg3NTQxMV0gUjEzOiBmZmZmOTgxZjFhZjQwMDAwIFIx
NDogMDAwMDAwMDAwMDAwMDAwMCBSMTU6IGZmZmY5ODFmMjVhNjAwMDANClsgIDE3NC44NzU0MTJd
IEZTOiAgMDAwMDAwMDAwMDAwMDAwMCgwMDAwKSBHUzpmZmZmOTgxZjNlYzAwMDAwKDAwMDApIGtu
bEdTOjAwMDAwMDAwMDAwMDAwMDANClsgIDE3NC44NzU0MTNdIENTOiAgMDAxMCBEUzogMDAwMCBF
UzogMDAwMCBDUjA6IDAwMDAwMDAwODAwNTAwMzMNClsgIDE3NC44NzU0MTRdIENSMjogMDAwMDdm
NDI4NThmMzAwMCBDUjM6IDAwMDAwMDA3ZjAyYWUwMDAgQ1I0OiAwMDAwMDAwMDAwMzQwNmYwDQpb
ICAxNzQuODc1NDE0XSBDYWxsIFRyYWNlOg0KWyAgMTc0Ljg3NTQ5OF0gIGRjX3ZhbGlkYXRlX2ds
b2JhbF9zdGF0ZSsweDI1Zi8weDJkMCBbYW1kZ3B1XQ0KWyAgMTc0Ljg3NTU4M10gIGFtZGdwdV9k
bV9hdG9taWNfY2hlY2srMHg4ZmYvMHhmMjAgW2FtZGdwdV0NClsgIDE3NC44NzU1ODddICA/IF9f
d3dfbXV0ZXhfbG9jay5pc3JhLjArMHgzYS8weDc2MA0KWyAgMTc0Ljg3NTU5MF0gID8gX2NvbmRf
cmVzY2hlZCsweDE1LzB4MzANClsgIDE3NC44NzU1OTFdICA/IF9fd3dfbXV0ZXhfbG9jay5pc3Jh
LjArMHgzYS8weDc2MA0KWyAgMTc0Ljg3NTYwNl0gIGRybV9hdG9taWNfY2hlY2tfb25seSsweDU1
NC8weDdlMCBbZHJtXQ0KWyAgMTc0Ljg3NTYyMF0gID8gZHJtX2Nvbm5lY3Rvcl9saXN0X2l0ZXJf
bmV4dCsweDdkLzB4OTAgW2RybV0NClsgIDE3NC44NzU2MzJdICBkcm1fYXRvbWljX2NvbW1pdCsw
eDEzLzB4NTAgW2RybV0NClsgIDE3NC44NzU2NDBdICBkcm1fYXRvbWljX2hlbHBlcl9kaXNhYmxl
X2FsbCsweDE0Yy8weDE2MCBbZHJtX2ttc19oZWxwZXJdDQpbICAxNzQuODc1NjQ3XSAgZHJtX2F0
b21pY19oZWxwZXJfc3VzcGVuZCsweDYwLzB4ZjAgW2RybV9rbXNfaGVscGVyXQ0KWyAgMTc0Ljg3
NTczMF0gIGRtX3N1c3BlbmQrMHgxYy8weDYwIFthbWRncHVdDQpbICAxNzQuODc1NzgyXSAgYW1k
Z3B1X2RldmljZV9pcF9zdXNwZW5kX3BoYXNlMSsweDgxLzB4ZTAgW2FtZGdwdV0NClsgIDE3NC44
NzU4MzZdICBhbWRncHVfZGV2aWNlX2lwX3N1c3BlbmQrMHgxYy8weDYwIFthbWRncHVdDQpbICAx
NzQuODc1OTIzXSAgYW1kZ3B1X2RldmljZV9wcmVfYXNpY19yZXNldCsweDE5MS8weDFhNCBbYW1k
Z3B1XQ0KWyAgMTc0Ljg3NjAxMF0gIGFtZGdwdV9kZXZpY2VfZ3B1X3JlY292ZXIuY29sZCsweDQz
YS8weGJjYSBbYW1kZ3B1XQ0KWyAgMTc0Ljg3NjA4NF0gIGFtZGdwdV9qb2JfdGltZWRvdXQrMHgx
MDMvMHgxMzAgW2FtZGdwdV0NClsgIDE3NC44NzYwODhdICBkcm1fc2NoZWRfam9iX3RpbWVkb3V0
KzB4N2YvMHhlMCBbZ3B1X3NjaGVkXQ0KWyAgMTc0Ljg3NjA5Ml0gIHByb2Nlc3Nfb25lX3dvcmsr
MHgxYjUvMHgzNjANClsgIDE3NC44NzYwOTRdICB3b3JrZXJfdGhyZWFkKzB4NTAvMHgzYzANClsg
IDE3NC44NzYwOTZdICBrdGhyZWFkKzB4ZjkvMHgxMzANClsgIDE3NC44NzYwOTddICA/IHByb2Nl
c3Nfb25lX3dvcmsrMHgzNjAvMHgzNjANClsgIDE3NC44NzYwOTldICA/IGt0aHJlYWRfcGFyaysw
eDkwLzB4OTANClsgIDE3NC44NzYxMDBdICByZXRfZnJvbV9mb3JrKzB4MjIvMHg0MA0KWyAgMTc0
Ljg3NjEwM10gLS0tWyBlbmQgdHJhY2UgYWY0MzY1ODA0YmYzMThjZSBdLS0tDQpbICAxNzUuMzQ2
OTM3XSBbZHJtOmdmeF92MTBfMF9od19maW5pIFthbWRncHVdXSAqRVJST1IqIEtHUSBkaXNhYmxl
IGZhaWxlZA0KWyAgMTc1LjYwMDE3OV0gW2RybTpnZnhfdjEwXzBfaHdfZmluaSBbYW1kZ3B1XV0g
KkVSUk9SKiBLQ1EgZGlzYWJsZSBmYWlsZWQNClsgIDE3NS44NTM0MThdIFtkcm06Z2Z4X3YxMF8w
X2NwX2dmeF9lbmFibGUgW2FtZGdwdV1dICpFUlJPUiogZmFpbGVkIHRvIGhhbHQgY3AgZ2Z4DQpb
ICAxNzUuODc0NjM5XSBbZHJtXSBwc3AgY29tbWFuZCAoMHgyKSBmYWlsZWQgYW5kIHJlc3BvbnNl
IHN0YXR1cyBpcyAoMHgxMTcpDQpbICAxNzguOTYzMjQ5XSBhbWRncHUgMDAwMDowYjowMC4wOiBH
UFUgcmVzZXQgc3VjY2VlZGVkLCB0cnlpbmcgdG8gcmVzdW1lDQpbICAxNzguOTYzMzY0XSBbZHJt
XSBQQ0lFIEdBUlQgb2YgNTEyTSBlbmFibGVkICh0YWJsZSBhdCAweDAwMDAwMDgwMDAzMDAwMDAp
Lg0KWyAgMTc4Ljk2NDIyN10gW2RybV0gUFNQIGlzIHJlc3VtaW5nLi4uDQpbICAxNzkuMTMwNDEz
XSBbZHJtOm1vZF9oZGNwX2FkZF9kaXNwbGF5X3RvcG9sb2d5IFthbWRncHVdXSAqRVJST1IqIEZh
aWxlZCB0byBhZGQgZGlzcGxheSB0b3BvbG9neSwgRFRNIFRBIGlzIG5vdCBpbml0aWFsaXplZC4N
ClsgIDE3OS4xMzA0OTJdIFtkcm06bW9kX2hkY3BfYWRkX2Rpc3BsYXlfdG9wb2xvZ3kgW2FtZGdw
dV1dICpFUlJPUiogRmFpbGVkIHRvIGFkZCBkaXNwbGF5IHRvcG9sb2d5LCBEVE0gVEEgaXMgbm90
IGluaXRpYWxpemVkLg0KWyAgMTc5LjEzODU4OV0gW2RybV0gcmVzZXJ2ZSAweGEwMDAwMCBmcm9t
IDB4ODFmZTQwMDAwMCBmb3IgUFNQIFRNUg0KWyAgMTc5LjMzMDYwMl0gYW1kZ3B1IDAwMDA6MGI6
MDAuMDogUkFTOiByYXMgdGEgdWNvZGUgaXMgbm90IGF2YWlsYWJsZQ0KWyAgMTc5LjM1NDk3NF0g
YW1kZ3B1OiBbcG93ZXJwbGF5XSBTTVUgaXMgcmVzdW1pbmcuLi4NClsgIDE3OS4zNTc2MTRdIGFt
ZGdwdTogW3Bvd2VycGxheV0gZHBtIGhhcyBiZWVuIGRpc2FibGVkDQpbICAxNzkuMzU3NjE3XSBh
bWRncHU6IFtwb3dlcnBsYXldIFNNVSBpcyByZXN1bWVkIHN1Y2Nlc3NmdWxseSENClsgIDE3OS42
NDkxNjhdIFtkcm1dIGtpcSByaW5nIG1lYyAyIHBpcGUgMSBxIDANClsgIDE3OS42NjM4MzNdIFtk
cm1dIFZDTiBkZWNvZGUgYW5kIGVuY29kZSBpbml0aWFsaXplZCBzdWNjZXNzZnVsbHkodW5kZXIg
RFBHIE1vZGUpLg0KWyAgMTc5LjY2Mzg3Ml0gW2RybV0gSlBFRyBkZWNvZGUgaW5pdGlhbGl6ZWQg
c3VjY2Vzc2Z1bGx5Lg0KWyAgMTc5LjY2Mzg3N10gYW1kZ3B1IDAwMDA6MGI6MDAuMDogcmluZyBn
ZnhfMC4wLjAgdXNlcyBWTSBpbnYgZW5nIDAgb24gaHViIDANClsgIDE3OS42NjM4NzhdIGFtZGdw
dSAwMDAwOjBiOjAwLjA6IHJpbmcgZ2Z4XzAuMS4wIHVzZXMgVk0gaW52IGVuZyAxIG9uIGh1YiAw
DQpbICAxNzkuNjYzODgwXSBhbWRncHUgMDAwMDowYjowMC4wOiByaW5nIGNvbXBfMS4wLjAgdXNl
cyBWTSBpbnYgZW5nIDQgb24gaHViIDANClsgIDE3OS42NjM4ODFdIGFtZGdwdSAwMDAwOjBiOjAw
LjA6IHJpbmcgY29tcF8xLjEuMCB1c2VzIFZNIGludiBlbmcgNSBvbiBodWIgMA0KWyAgMTc5LjY2
Mzg4Ml0gYW1kZ3B1IDAwMDA6MGI6MDAuMDogcmluZyBjb21wXzEuMi4wIHVzZXMgVk0gaW52IGVu
ZyA2IG9uIGh1YiAwDQpbICAxNzkuNjYzODgzXSBhbWRncHUgMDAwMDowYjowMC4wOiByaW5nIGNv
bXBfMS4zLjAgdXNlcyBWTSBpbnYgZW5nIDcgb24gaHViIDANClsgIDE3OS42NjM4ODRdIGFtZGdw
dSAwMDAwOjBiOjAwLjA6IHJpbmcgY29tcF8xLjAuMSB1c2VzIFZNIGludiBlbmcgOCBvbiBodWIg
MA0KWyAgMTc5LjY2Mzg4Nl0gYW1kZ3B1IDAwMDA6MGI6MDAuMDogcmluZyBjb21wXzEuMS4xIHVz
ZXMgVk0gaW52IGVuZyA5IG9uIGh1YiAwDQpbICAxNzkuNjYzODg3XSBhbWRncHUgMDAwMDowYjow
MC4wOiByaW5nIGNvbXBfMS4yLjEgdXNlcyBWTSBpbnYgZW5nIDEwIG9uIGh1YiAwDQpbICAxNzku
NjYzODg4XSBhbWRncHUgMDAwMDowYjowMC4wOiByaW5nIGNvbXBfMS4zLjEgdXNlcyBWTSBpbnYg
ZW5nIDExIG9uIGh1YiAwDQpbICAxNzkuNjYzODg5XSBhbWRncHUgMDAwMDowYjowMC4wOiByaW5n
IGtpcV8yLjEuMCB1c2VzIFZNIGludiBlbmcgMTIgb24gaHViIDANClsgIDE3OS42NjM4OTBdIGFt
ZGdwdSAwMDAwOjBiOjAwLjA6IHJpbmcgc2RtYTAgdXNlcyBWTSBpbnYgZW5nIDEzIG9uIGh1YiAw
DQpbICAxNzkuNjYzODkxXSBhbWRncHUgMDAwMDowYjowMC4wOiByaW5nIHNkbWExIHVzZXMgVk0g
aW52IGVuZyAxNCBvbiBodWIgMA0KWyAgMTc5LjY2Mzg5Ml0gYW1kZ3B1IDAwMDA6MGI6MDAuMDog
cmluZyB2Y25fZGVjIHVzZXMgVk0gaW52IGVuZyAwIG9uIGh1YiAxDQpbICAxNzkuNjYzODkzXSBh
bWRncHUgMDAwMDowYjowMC4wOiByaW5nIHZjbl9lbmMwIHVzZXMgVk0gaW52IGVuZyAxIG9uIGh1
YiAxDQpbICAxNzkuNjYzODk0XSBhbWRncHUgMDAwMDowYjowMC4wOiByaW5nIHZjbl9lbmMxIHVz
ZXMgVk0gaW52IGVuZyA0IG9uIGh1YiAxDQpbICAxNzkuNjYzODk1XSBhbWRncHUgMDAwMDowYjow
MC4wOiByaW5nIGpwZWdfZGVjIHVzZXMgVk0gaW52IGVuZyA1IG9uIGh1YiAxDQpbICAxNzkuNjc1
ODA0XSBbZHJtXSByZWNvdmVyIHZyYW0gYm8gZnJvbSBzaGFkb3cgc3RhcnQNClsgIDE3OS42Nzcz
NDJdIFtkcm1dIHJlY292ZXIgdnJhbSBibyBmcm9tIHNoYWRvdyBkb25lDQpbICAxNzkuNjc3MzQ0
XSBbZHJtXSBTa2lwIHNjaGVkdWxpbmcgSUJzIQ0KWyAgMTc5LjY3NzM0NV0gW2RybV0gU2tpcCBz
Y2hlZHVsaW5nIElCcyENClsgIDE3OS42NzczNTddIGFtZGdwdSAwMDAwOjBiOjAwLjA6IEdQVSBy
ZXNldCgxKSBzdWNjZWVkZWQhDQpbICAxNzkuNjc3MzY3XSBbZHJtXSBTa2lwIHNjaGVkdWxpbmcg
SUJzIQ0KWyAgMTc5LjY3NzM3Ml0gW2RybV0gU2tpcCBzY2hlZHVsaW5nIElCcyENClsgIDE3OS42
NzczNzVdIFtkcm1dIFNraXAgc2NoZWR1bGluZyBJQnMhDQpbICAxNzkuNjc3Mzc4XSBbZHJtXSBT
a2lwIHNjaGVkdWxpbmcgSUJzIQ0KWyAgMTc5LjY3NzM4MF0gW2RybV0gU2tpcCBzY2hlZHVsaW5n
IElCcyENClsgIDE3OS42NzczODJdIFtkcm1dIFNraXAgc2NoZWR1bGluZyBJQnMhDQpbICAxNzku
Njc3MzgzXSBbZHJtXSBTa2lwIHNjaGVkdWxpbmcgSUJzIQ0KDQoNClBpZXJyZS1FcmljDQoNCk9u
IDI3LzAxLzIwMjAgMjA6MzcsIEFsZXggRGV1Y2hlciB3cm90ZToNCj4gSGFzIGJlZW4gd29ya2lu
ZyBmaW5lIGZvciBhIHdoaWxlLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogQWxleCBEZXVjaGVyIDxh
bGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPg0KPiAtLS0NCj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L2FtZGdwdV9kZXZpY2UuYyB8IDMgKysrDQo+ICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNl
cnRpb25zKCspDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
YW1kZ3B1X2RldmljZS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rldmlj
ZS5jDQo+IGluZGV4IDFkYTAzNjU4ODkxYy4uNjkyNDhkMWIyNDE3IDEwMDY0NA0KPiAtLS0gYS9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGV2aWNlLmMNCj4gKysrIGIvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RldmljZS5jDQo+IEBAIC0zNzYyLDYgKzM3NjIs
OSBAQCBib29sIGFtZGdwdV9kZXZpY2Vfc2hvdWxkX3JlY292ZXJfZ3B1KHN0cnVjdCBhbWRncHVf
ZGV2aWNlICphZGV2KQ0KPiAgCQljYXNlIENISVBfVkVHQTEyOg0KPiAgCQljYXNlIENISVBfUkFW
RU46DQo+ICAJCWNhc2UgQ0hJUF9BUkNUVVJVUzoNCj4gKwkJY2FzZSBDSElQX05BVkkxMDoNCj4g
KwkJY2FzZSBDSElQX05BVkkxNDoNCj4gKwkJY2FzZSBDSElQX05BVkkxMjoNCj4gIAkJCWJyZWFr
Ow0KPiAgCQlkZWZhdWx0Og0KPiAgCQkJZ290byBkaXNhYmxlZDsNCj4gDQo=

--------------CC23C746D24377BE4EF3517B
Content-Type: text/plain; charset=UTF-8;
 name="pp_dpm_before_after.txt"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="pp_dpm_before_after.txt"

QkVGT1JFIHJlc2V0Ci0tLS0tLS0tLS0tLQoKIyBoZWFkIHBwX2RwbV8qCj09PiBwcF9kcG1fZGNl
ZmNsayA8PT0KMDogNTA2TWh6ICoKMTogODg2TWh6IAoyOiAxMjY2TWh6IAoKPT0+IHBwX2RwbV9m
Y2xrIDw9PQowOiA1MDZNaHogCjE6IDk1ME1oeiAqCjI6IDEyNjZNaHogCgo9PT4gcHBfZHBtX21j
bGsgPD09CjA6IDEwME1oeiAKMTogNTAwTWh6IAoyOiA2MjVNaHogCjM6IDg3NU1oeiAqCgo9PT4g
cHBfZHBtX3BjaWUgPD09CjA6IDIuNUdUL3MsIHgxNiA2MTlNaHogCjE6IDguMEdUL3MsIHgxNiA2
MTlNaHogKgoKPT0+IHBwX2RwbV9zY2xrIDw9PQowOiAzMDBNaHogCjE6IDgwME1oeiAqCjI6IDE3
NTBNaHogCgo9PT4gcHBfZHBtX3NvY2NsayA8PT0KMDogNTA2TWh6IAoxOiA5NTBNaHogKgoyOiAx
MjY2TWh6IAoKQUZURVIgcmVzZXQKLS0tLS0tLS0tLS0KIyBoZWFkIHBwX2RwbV8qCj09PiBwcF9k
cG1fZGNlZmNsayA8PT0KMDogNTA2TWh6ICoKMTogODg2TWh6IAoyOiAxMjY2TWh6IAoKPT0+IHBw
X2RwbV9mY2xrIDw9PQowOiA1MDZNaHogKgoxOiA4ODZNaHogCjI6IDEyNjZNaHogCgo9PT4gcHBf
ZHBtX21jbGsgPD09Cgo9PT4gcHBfZHBtX3BjaWUgPD09CjA6IDIuNUdUL3MsIHgxNiA2MTlNaHog
CjE6IDguMEdUL3MsIHgxNiA2MTlNaHogKgoKPT0+IHBwX2RwbV9zY2xrIDw9PQowOiAwTWh6IAox
OiA4MDBNaHogKgoyOiAwTWh6IAoKPT0+IHBwX2RwbV9zb2NjbGsgPD09CjA6IDBNaHogCjE6IDUw
Nk1oeiAqCjI6IDBNaHogCgoK

--------------CC23C746D24377BE4EF3517B
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

--------------CC23C746D24377BE4EF3517B--
