Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CC9814AA58
	for <lists+amd-gfx@lfdr.de>; Mon, 27 Jan 2020 20:19:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A8F86E93B;
	Mon, 27 Jan 2020 19:19:01 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700070.outbound.protection.outlook.com [40.107.70.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 677056E93B
 for <amd-gfx@lists.freedesktop.org>; Mon, 27 Jan 2020 19:19:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H/tAI6oNMg+G7YcSkMn+ezNeXKf30TX4wj/oEwJAXpGBE4SK3Bq2n12O0RBwpbNOvV6BHdCJJfXtbzt1qh+tgnUbIpuDY9HnVRUkPAIV+Ot2GWgDM/pNEPAGC3cOHU7TTr7QKBBbY08MYvCtaSmw85CjGoH4CfVQRSPvs9e1fyML6pgV5sfuuBCxKQrvus3MzxZLJkEx3KD/82tgjnDG4EWu6U9Cg+9hJ29apyTkHmplXLI8XfeqUBnQNPdz1ljnuWZC3eXxzhpIZANRSDPbsWx0d00yBK35+N3s6hCLauuB6RHisetltpEwk4KVlslacSpmAFf3a9LFEN/8lI0DuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/zhAjftk/0dqARb70hlZ/O1nQIUiQsOg+inqPbjeWvY=;
 b=VtZigBcRIKEW2v33K8wglC7FMoqCzyW2bTKGkXFMUS+J5d83v4wcBlH20UPLk9tI9+aLAwGThM0CGLU5bgkqt5zC+Z2nHkLDLudx4bn3DdgAqzRxFAlirWmIus8RULsjP0MFFYSyEQhBDbJJSEwpm6YI1ZRIOdlTlbqCHgW8002zZ1Gvx5gFaM9NlRSZEGwY94CGzemTSkz8g/vnifAVsx0RQ/5p/qx7B5UBxz65ll7a331M/G7PrmgN/MnJTRHlEqjMNStFXI+9xbVcFTI5V/a4353eqsQHxgxJqz1mZIvAnDuDkz8/6AYbhWfllYfP/LN5tK9MdKpJZi1pb1+Wyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/zhAjftk/0dqARb70hlZ/O1nQIUiQsOg+inqPbjeWvY=;
 b=s26/n34/7/yJrA3r0xMWKYKE3yE+Lfsjrjs3SRPP7BcIKo8DM6rJHEejCnkxGtQpaBJK0E5UC0EXwMo3Jlkdi/wtzhQQavHRaw6kL+3XFkKaGseEtrkfUNXS3ns1GKbHlp1dghtZqx3qLNMaEv0t9E4pntFGZ0XMk5a4Tw2BwJ8=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Tom.StDenis@amd.com; 
Received: from MN2PR12MB3935.namprd12.prod.outlook.com (10.255.237.223) by
 MN2PR12MB3342.namprd12.prod.outlook.com (20.178.240.224) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2665.24; Mon, 27 Jan 2020 19:18:57 +0000
Received: from MN2PR12MB3935.namprd12.prod.outlook.com
 ([fe80::4de1:e7cb:7d68:b666]) by MN2PR12MB3935.namprd12.prod.outlook.com
 ([fe80::4de1:e7cb:7d68:b666%7]) with mapi id 15.20.2665.025; Mon, 27 Jan 2020
 19:18:56 +0000
Subject: Re: [PATCH 2/4] drm/amdgpu: allow higher level PD invalidations
To: christian.koenig@amd.com, amd-gfx@lists.freedesktop.org,
 Felix.Kuehling@amd.com
References: <20200123142122.4084-1-christian.koenig@amd.com>
 <20200123142122.4084-2-christian.koenig@amd.com>
 <ed844e9a-1587-7b1b-7ffe-9989ecf30b59@amd.com>
 <a054ba94-bece-82dc-93a2-0167c2cee87d@amd.com>
 <a9313c2a-213b-d706-f308-08315c6e2503@gmail.com>
From: Tom St Denis <tom.stdenis@amd.com>
Message-ID: <7f77c35f-97ba-48ec-495d-1bf06da20cd3@amd.com>
Date: Mon, 27 Jan 2020 14:18:54 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
In-Reply-To: <a9313c2a-213b-d706-f308-08315c6e2503@gmail.com>
Content-Language: en-US
X-ClientProxiedBy: YQXPR01CA0114.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c00:41::43) To MN2PR12MB3935.namprd12.prod.outlook.com
 (2603:10b6:208:168::31)
MIME-Version: 1.0
Received: from localhost.localdomain (64.231.93.139) by
 YQXPR01CA0114.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:c00:41::43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2665.20 via Frontend Transport; Mon, 27 Jan 2020 19:18:56 +0000
X-Originating-IP: [64.231.93.139]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: b0d1594e-1b1b-41bf-2e62-08d7a35dc131
X-MS-TrafficTypeDiagnostic: MN2PR12MB3342:|MN2PR12MB3342:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB3342AF37A914AEBDD83B4757F70B0@MN2PR12MB3342.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-Forefront-PRVS: 02951C14DC
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(136003)(346002)(376002)(366004)(39860400002)(189003)(199004)(2616005)(956004)(86362001)(31696002)(66476007)(45080400002)(66946007)(36756003)(316002)(66556008)(6506007)(53546011)(478600001)(6636002)(81166006)(52116002)(81156014)(16526019)(5660300002)(8676002)(26005)(6486002)(6512007)(66574012)(2906002)(186003)(31686004)(8936002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3342;
 H:MN2PR12MB3935.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: W/i5Pov6XTRvPtZeD4j+dwnm7h6uThMrqx3DSs/kVfnw/LHHOWc50tRdsLaPiCFQMFsOMSsHHo4nfHeFD1FQVEVplxyFGUfpdxY/cZDTOCLh91FocA/YKhfmZv6H25Z3AiZVUTlx/YswJUi7GpsClcNizkkN6AKHfncmzljbMxiLuoPy5xhiXfxipmAkUdkwJckpaePOYoNAvkw+Zyep51/dA7fU3g3eGg2cNxpLWKaVCuc9NOul/MZDD7bfvUg8OjavVGDiuVZxXImkiOLUv7YntMgRvEsDp3Jew1ljmlIO4QHQ8NyoyvQ6/HXGHY9bwDwfUG950zE4D7DYDlKurVEz35aaZxsiLGgk7chydmAv48w+5kyUUfVMfJCqK4g4jA6coi5UHwGMnFXtczb6/c42hpo0T7Y/PpHSLDU2f/lzNzM7DXyooCdPjcwvmr6D
X-MS-Exchange-AntiSpam-MessageData: 5yoVozk3GwQrBa2PVmpdejkYKhiNBAKNn9BlXtT3ILlWdsH+QHu9tWhh56Ga8fi0zNrN/M+xV5kC42Xsa35lrrIk2dGFYPFgqxim6EQTrT4gAFR0Q0dbp2juU6phSbc/znPqP2OgTsmAw+Xk0zDmVw==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b0d1594e-1b1b-41bf-2e62-08d7a35dc131
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2020 19:18:56.7664 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 32QitZpNoUy0ZdFxLuPYqySYVtEsYr7olQIbLvylRrdVEQCvoQ2Rh0BA0J5sBHDAITWQfajlwBkabo8M4Ic24w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3342
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Tm8gcHJvYmxlbW8swqAgbWF5YmUgd2Ugc2hvdWxkIHNwbGl0IHRoYXQgQlVHKCkgc3RhdGVtZW50
IHRvIGNhdGNoIHRoZSAKdHdvIGhhbHZlcyBvZiB0aGUgUERFIGFkZHJlc3Mgc28gbmV4dCB0aW1l
IGl0J2xsIGJlIG1vcmUgb2J2aW91cy4KCkZvciByZWYgdGhvdWdoIHlvdXIgNCBwYXRjaGVzIGhh
dmUgYXBwbGllZCBjbGVhbmx5IG9uIHRvcCBvZiBkcm0tbmV4dCAKZXZlcnkgZGF5IGFuZCB3b3Jr
IGZpbmUgb24gbXkgbmF2aTEwL3JhdmVuMSBzeXN0ZW0uwqAgU28gaXQgc2VlbXMgbGlrZSAKanVz
dCBnbWM4IGlzIGFmZmVjdGVkIChJIGRvbid0IGhhdmUgYW55IDYvNyBoYXJkd2FyZSB0byB0ZXN0
KS4KClRvbQoKCk9uIDIwMjAtMDEtMjcgMjoxNCBwLm0uLCBDaHJpc3RpYW4gS8O2bmlnIHdyb3Rl
Ogo+IE9ILCB0aGFua3MgZm9yIHRoYXQgaGludCEgSSB3YXMgc3RhcmluZyBhdCB0aGUgY29kZSBm
b3IgYSBkYXkgbm93IAo+IHdpdGhvdXQgaGF2aW5nIGEgY2x1ZSB3aGF0J3MgZ29pbmcgd3Jvbmcu
Cj4KPiBIYXZlbid0IHJlYWxpemVkIHRoYXQgc29tZXRoaW5nIGNvdWxkIGhhdmUgYmVlbiBzaWdu
IGV4dGVuZGVkIQo+Cj4gUHJvYmFibHkgZ29pbmcgdG8gZmlndXJlIGl0IG91dCBieSB0b21vcnJv
dyBub3csCj4gQ2hyaXN0aWFuLgo+Cj4gQW0gMjcuMDEuMjAgdW0gMTg6Mzcgc2NocmllYiBUb20g
U3QgRGVuaXM6Cj4+IFRoZSBvZmZlbmRpbmcgUERFIGFkZHJlc3MgaXM6ICIzZmZmZmVmZjYwMDAw
MCIKPj4KPj4gV2hpY2ggbG9va3MgbGlrZSBpdCB3YXMgc2lnbiBleHRlbmRlZCBpbnRvIHRoZSAi
cmVzZXJ2ZWQiIHNlY3Rpb24gCj4+IGJldHdlZW4gYml0cyA0MDo1OCAoMHgzZmZmKSBoZW5jZSB0
cmlnZ2VyaW5nIHRoZSBCVUcoKSBpbiB0aGUgZ21jX3Y4IAo+PiBkcml2ZXIuCj4+Cj4+IFRvbQo+
Pgo+PiBPbiAyMDIwLTAxLTI3IDk6NTcgYS5tLiwgVG9tIFN0IERlbmlzIHdyb3RlOgo+Pj4gUmV2
ZXJ0aW5nIHRoaXMgcGF0Y2ggYXZvaWRzIHRoZSBnbWNfdjggZXJyb3JzIChJIHByZXZpb3VzbHkg
c2VudCAKPj4+IGtlcm5lbCBsb2dzLCBoZXJlJ3Mgb25lIGZvciBjb252ZW5pZW5jZSk6Cj4+Pgo+
Pj4gW8KgIDM1OC41NTQzMzVdIC0tLS0tLS0tLS0tLVsgY3V0IGhlcmUgXS0tLS0tLS0tLS0tLQo+
Pj4gW8KgIDM1OC41NTQzMzhdIGtlcm5lbCBCVUcgYXQgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvZ21jX3Y4XzAuYzo3MjUhCj4+PiBbwqAgMzU4LjU1NDM1MV0gaW52YWxpZCBvcGNvZGU6IDAw
MDAgWyMxXSBTTVAgTk9QVEkKPj4+IFvCoCAzNTguNTU0MzU0XSBDUFU6IDAgUElEOiA0NTUxIENv
bW06IFh3YXlsYW5kIE5vdCB0YWludGVkIAo+Pj4gNS40LjAtcmM3KyAjMTQKPj4+IFvCoCAzNTgu
NTU0MzU1XSBIYXJkd2FyZSBuYW1lOiBTeXN0ZW0gbWFudWZhY3R1cmVyIFN5c3RlbSBQcm9kdWN0
IAo+Pj4gTmFtZS9UVUYgQjM1ME0tUExVUyBHQU1JTkcsIEJJT1MgNTIyMCAwOS8xMi8yMDE5Cj4+
PiBbwqAgMzU4LjU1NDQ1Ml0gUklQOiAwMDEwOmdtY192OF8wX2dldF92bV9wZGUrMHgxMC8weDIw
IFthbWRncHVdCj4+PiBbwqAgMzU4LjU1NDQ1NV0gQ29kZTogMzEgZjYgNDggODkgZGYgZTggMzAg
ZTkgZmYgZmYgZTkgMjggZmYgZmYgZmYgZTggCj4+PiAxNiBkNiAyMSBmOSA2NiAwZiAxZiA0NCAw
MCAwMCA0OCBiOCBmZiAwZiAwMCAwMCAwMCBmZiBmZiBmZiA0OCA4NSAwMiAKPj4+IDc1IDAxIGMz
IDwwZj4gMGIgNjYgNjYgMmUgMGYgMWYgODQgMDAgMDAgMDAgMDAgMDAgMGYgMWYgMDAgNTUgNDgg
ODkgCj4+PiBmZCBlOCBjNwo+Pj4gW8KgIDM1OC41NTQ0NTZdIFJTUDogMDAxODpmZmZmYTI4MTQy
Mjg3YTAwIEVGTEFHUzogMDAwMTAyMDYKPj4+IFvCoCAzNTguNTU0NDU4XSBSQVg6IGZmZmZmZjAw
MDAwMDBmZmYgUkJYOiAwMDAwMDAwMDAwMDAwMDAwIFJDWDogCj4+PiBmZmZmYTI4MTQyMjg3YTc4
Cj4+PiBbwqAgMzU4LjU1NDQ1OV0gUkRYOiBmZmZmYTI4MTQyMjg3YTUwIFJTSTogMDAwMDAwMDAw
MDAwMDAwMiBSREk6IAo+Pj4gZmZmZjhiOWJlMTVlMDAwMAo+Pj4gW8KgIDM1OC41NTQ0NjBdIFJC
UDogMDAwMDAwMDAwMDAwMDAwMSBSMDg6IDAwMDAwMDAwMDAwMDAwMDAgUjA5OiAKPj4+IDAwMDAw
MDAwMDAwMDAwMDAKPj4+IFvCoCAzNTguNTU0NDYxXSBSMTA6IDAwMDAwMDAwMDAwMDAwMGYgUjEx
OiAwMDAwMDAwMDAwMDAwNDA2IFIxMjogCj4+PiAwMDAwMDAwMDAwMDAyMDMwCj4+PiBbwqAgMzU4
LjU1NDQ2Ml0gUjEzOiAwMDNmZmZmZWZlYTAwMDAwIFIxNDogMDAwMDAwMDAwMDEwMWMwMCBSMTU6
IAo+Pj4gZmZmZmEyODE0MjI4N2FmMAo+Pj4gW8KgIDM1OC41NTQ0NjRdIEZTOsKgIDAwMDA3ZjE4
MGE0OGJhODAoMDAwMCkgR1M6ZmZmZjhiOWJlNmMwMDAwMCgwMDAwKSAKPj4+IGtubEdTOjAwMDAw
MDAwMDAwMDAwMDAKPj4+IFvCoCAzNTguNTU0NDY1XSBDUzrCoCAwMDEwIERTOiAwMDAwIEVTOiAw
MDAwIENSMDogMDAwMDAwMDA4MDA1MDAzMwo+Pj4gW8KgIDM1OC41NTQ0NjZdIENSMjogMDAwMDdm
M2RlOGY1ZGNjMCBDUjM6IDAwMDAwMDAyMTcwYzgwMDAgQ1I0OiAKPj4+IDAwMDAwMDAwMDAxNDA2
ZjAKPj4+IFvCoCAzNTguNTU0NDY3XSBDYWxsIFRyYWNlOgo+Pj4gW8KgIDM1OC41NTQ1MDJdwqAg
YW1kZ3B1X3ZtX3VwZGF0ZV9wdGVzKzB4MjhhLzB4N2YwIFthbWRncHVdCj4+PiBbwqAgMzU4LjU1
NDUzNF3CoCA/IGFtZGdwdV9zeW5jX3Jlc3YrMHgzNC8weDE5MCBbYW1kZ3B1XQo+Pj4gW8KgIDM1
OC41NTQ1NjVdwqAgYW1kZ3B1X3ZtX2JvX3VwZGF0ZV9tYXBwaW5nKzB4MTJiLzB4MTYwIFthbWRn
cHVdCj4+PiBbwqAgMzU4LjU1NDU5Nl3CoCBhbWRncHVfdm1fYm9fdXBkYXRlKzB4MzMzLzB4NmEw
IFthbWRncHVdCj4+PiBbwqAgMzU4LjU1NDYyNl3CoCBhbWRncHVfZ2VtX3ZhX2lvY3RsKzB4M2Mx
LzB4M2UwIFthbWRncHVdCj4+PiBbwqAgMzU4LjU1NDY1OF3CoCA/IGFtZGdwdV9nZW1fdmFfbWFw
X2ZsYWdzKzB4NjAvMHg2MCBbYW1kZ3B1XQo+Pj4gW8KgIDM1OC41NTQ2NjNdwqAgZHJtX2lvY3Rs
X2tlcm5lbCsweGE1LzB4ZjAKPj4+IFvCoCAzNTguNTU0NjY1XcKgIGRybV9pb2N0bCsweDFkZi8w
eDM2Ngo+Pj4gW8KgIDM1OC41NTQ2OTVdwqAgPyBhbWRncHVfZ2VtX3ZhX21hcF9mbGFncysweDYw
LzB4NjAgW2FtZGdwdV0KPj4+IFvCoCAzNTguNTU0Njk4XcKgID8gX19zd2l0Y2hfdG9fYXNtKzB4
MzQvMHg3MAo+Pj4gW8KgIDM1OC41NTQ2OTldwqAgPyBfX3N3aXRjaF90b19hc20rMHg0MC8weDcw
Cj4+PiBbwqAgMzU4LjU1NDcwMV3CoCA/IF9fc3dpdGNoX3RvX2FzbSsweDM0LzB4NzAKPj4+IFvC
oCAzNTguNTU0NzAyXcKgID8gX19zd2l0Y2hfdG9fYXNtKzB4NDAvMHg3MAo+Pj4gW8KgIDM1OC41
NTQ3MDNdwqAgPyBfX3N3aXRjaF90b19hc20rMHgzNC8weDcwCj4+PiBbwqAgMzU4LjU1NDcwNF3C
oCA/IF9fc3dpdGNoX3RvX2FzbSsweDQwLzB4NzAKPj4+IFvCoCAzNTguNTU0NzMxXcKgIGFtZGdw
dV9kcm1faW9jdGwrMHg0NC8weDgwIFthbWRncHVdCj4+PiBbwqAgMzU4LjU1NDczNV3CoCBkb192
ZnNfaW9jdGwrMHgzZjAvMHg2NTAKPj4+IFvCoCAzNTguNTU0NzM3XcKgID8gX19zY2hlZHVsZSsw
eDI4Yy8weDVhMAo+Pj4gW8KgIDM1OC41NTQ3MzhdwqAga3N5c19pb2N0bCsweDU5LzB4OTAKPj4+
IFvCoCAzNTguNTU0NzQwXcKgIF9feDY0X3N5c19pb2N0bCsweDExLzB4MjAKPj4+IFvCoCAzNTgu
NTU0NzQzXcKgIGRvX3N5c2NhbGxfNjQrMHg0My8weDExMAo+Pj4gW8KgIDM1OC41NTQ3NDVdwqAg
ZW50cnlfU1lTQ0FMTF82NF9hZnRlcl9od2ZyYW1lKzB4NDQvMHhhOQo+Pj4gW8KgIDM1OC41NTQ3
NDddIFJJUDogMDAzMzoweDdmMTgwOWU2NjM4Ygo+Pj4gW8KgIDM1OC41NTQ3NDldIENvZGU6IDBm
IDFlIGZhIDQ4IDhiIDA1IGZkIDlhIDBjIDAwIDY0IGM3IDAwIDI2IDAwIDAwIAo+Pj4gMDAgNDgg
YzcgYzAgZmYgZmYgZmYgZmYgYzMgNjYgMGYgMWYgNDQgMDAgMDAgZjMgMGYgMWUgZmEgYjggMTAg
MDAgMDAgCj4+PiAwMCAwZiAwNSA8NDg+IDNkIDAxIGYwIGZmIGZmIDczIDAxIGMzIDQ4IDhiIDBk
IGNkIDlhIDBjIDAwIGY3IGQ4IDY0IAo+Pj4gODkgMDEgNDgKPj4+IFvCoCAzNTguNTU0NzUwXSBS
U1A6IDAwMmI6MDAwMDdmZmZhYzIwYTYzOCBFRkxBR1M6IDAwMDAwMjQ2IE9SSUdfUkFYOiAKPj4+
IDAwMDAwMDAwMDAwMDAwMTAKPj4+IFvCoCAzNTguNTU0NzUxXSBSQVg6IGZmZmZmZmZmZmZmZmZm
ZGEgUkJYOiAwMDAwN2ZmZmFjMjBhNjkwIFJDWDogCj4+PiAwMDAwN2YxODA5ZTY2MzhiCj4+PiBb
wqAgMzU4LjU1NDc1Ml0gUkRYOiAwMDAwN2ZmZmFjMjBhNjkwIFJTSTogMDAwMDAwMDBjMDI4NjQ0
OCBSREk6IAo+Pj4gMDAwMDAwMDAwMDAwMDAwZQo+Pj4gW8KgIDM1OC41NTQ3NTNdIFJCUDogMDAw
MDAwMDBjMDI4NjQ0OCBSMDg6IDAwMDAwMDAxMDE2MDAwMDAgUjA5OiAKPj4+IDAwMDAwMDAwMDAw
MDAwMGUKPj4+IFvCoCAzNTguNTU0NzU0XSBSMTA6IDAwMDAwMDAwMDAwMDAwZTAgUjExOiAwMDAw
MDAwMDAwMDAwMjQ2IFIxMjogCj4+PiAwMDAwMDAwMDAwMDAwMDAwCj4+PiBbwqAgMzU4LjU1NDc1
NF0gUjEzOiAwMDAwMDAwMDAwMDAwMDBlIFIxNDogMDAwMDAwMDAwMDAwMDAwMSBSMTU6IAo+Pj4g
MDAwMDU2M2Q0OGJmZDFmMAo+Pj4gW8KgIDM1OC41NTQ3NTZdIE1vZHVsZXMgbGlua2VkIGluOiBh
bWRncHUgZ3B1X3NjaGVkIHR0bSByODE1MiBlZml2YXJmcwo+Pj4gW8KgIDM1OC41NTQ3OTBdIC0t
LVsgZW5kIHRyYWNlIGUwZDU0ZjZjNDk5MDIzNTYgXS0tLQo+Pj4gW8KgIDM1OC41NTQ4MjRdIFJJ
UDogMDAxMDpnbWNfdjhfMF9nZXRfdm1fcGRlKzB4MTAvMHgyMCBbYW1kZ3B1XQo+Pj4KPj4+ICh0
aGUgZ21jX3Y4IGJ1ZyB0cmlnZ2VycyByZWdhcmRsZXNzIG9mIHdoZXRoZXIgSSdtIHJ1bm5pbmcg
cGlnbGl0IG9uIAo+Pj4gbXkgaGVhZGxlc3MgdmVnYTIwIG9yIGRpcmVjdGx5IG9uIHRoZSBjYXJy
aXpvKS4KPj4+Cj4+PiBIb3dldmVyLCB3aXRoIHBhdGNoIDIgb2YgNCByZXZlcnRlZCBJIHRoZW4g
Z2V0Ogo+Pj4KPj4+IFsgMTQ3MS4zMzgwODldIFtkcm06YW1kZ3B1X2dlbV92YV9pb2N0bCBbYW1k
Z3B1XV0gKkVSUk9SKiBDb3VsZG4ndCAKPj4+IHVwZGF0ZSBCT19WQSAoLTIpCj4+PiBbIDE0NzEu
MzM4NjQ3XSBbZHJtOmFtZGdwdV9nZW1fdmFfaW9jdGwgW2FtZGdwdV1dICpFUlJPUiogQ291bGRu
J3QgCj4+PiB1cGRhdGUgQk9fVkEgKC0yKQo+Pj4gWyAxNDcxLjMzOTgwN10gW2RybTphbWRncHVf
Z2VtX3ZhX2lvY3RsIFthbWRncHVdXSAqRVJST1IqIENvdWxkbid0IAo+Pj4gdXBkYXRlIEJPX1ZB
ICgtMikKPj4+IFsgMTQ3MS4zNDE2OTldIFtkcm06YW1kZ3B1X2dlbV92YV9pb2N0bCBbYW1kZ3B1
XV0gKkVSUk9SKiBDb3VsZG4ndCAKPj4+IHVwZGF0ZSBCT19WQSAoLTIpCj4+PiBbIDE0NzEuMzQy
MzQ4XSBbZHJtOmFtZGdwdV9nZW1fdmFfaW9jdGwgW2FtZGdwdV1dICpFUlJPUiogQ291bGRuJ3Qg
Cj4+PiB1cGRhdGUgQk9fVkEgKC0yKQo+Pj4gWyAxNDcxLjM0MjQ3NF0gW2RybTphbWRncHVfZ2Vt
X3ZhX2lvY3RsIFthbWRncHVdXSAqRVJST1IqIENvdWxkbid0IAo+Pj4gdXBkYXRlIEJPX1ZBICgt
MikKPj4+IFsgMTQ3MS4zNDI1MzJdIFtkcm06YW1kZ3B1X2dlbV92YV9pb2N0bCBbYW1kZ3B1XV0g
KkVSUk9SKiBDb3VsZG4ndCAKPj4+IHVwZGF0ZSBCT19WQSAoLTIpCj4+PiBbIDE0NzEuMzQyNTgz
XSBbZHJtOmFtZGdwdV9nZW1fdmFfaW9jdGwgW2FtZGdwdV1dICpFUlJPUiogQ291bGRuJ3QgCj4+
PiB1cGRhdGUgQk9fVkEgKC0yKQo+Pj4gWyAxNDcxLjM0MjYzNl0gW2RybTphbWRncHVfZ2VtX3Zh
X2lvY3RsIFthbWRncHVdXSAqRVJST1IqIENvdWxkbid0IAo+Pj4gdXBkYXRlIEJPX1ZBICgtMikK
Pj4+IFsgMTQ3MS4zNDI2OTRdIFtkcm06YW1kZ3B1X2dlbV92YV9pb2N0bCBbYW1kZ3B1XV0gKkVS
Uk9SKiBDb3VsZG4ndCAKPj4+IHVwZGF0ZSBCT19WQSAoLTIpCj4+PiBbIDE0NzEuMzQyNzQ1XSBb
ZHJtOmFtZGdwdV9nZW1fdmFfaW9jdGwgW2FtZGdwdV1dICpFUlJPUiogQ291bGRuJ3QgCj4+PiB1
cGRhdGUgQk9fVkEgKC0yKQo+Pj4gWyAxNDcxLjM0Mjc5Nl0gW2RybTphbWRncHVfZ2VtX3ZhX2lv
Y3RsIFthbWRncHVdXSAqRVJST1IqIENvdWxkbid0IAo+Pj4gdXBkYXRlIEJPX1ZBICgtMikKPj4+
IFsgMTQ3MS4zNDM1NTVdIFtkcm06YW1kZ3B1X2dlbV92YV9pb2N0bCBbYW1kZ3B1XV0gKkVSUk9S
KiBDb3VsZG4ndCAKPj4+IHVwZGF0ZSBCT19WQSAoLTIpCj4+PiBbIDE0NzEuMzUwMjcwXSBbZHJt
OmFtZGdwdV9nZW1fdmFfaW9jdGwgW2FtZGdwdV1dICpFUlJPUiogQ291bGRuJ3QgCj4+PiB1cGRh
dGUgQk9fVkEgKC0yKQo+Pj4gWyAxNDcxLjM1MDM1MV0gW2RybTphbWRncHVfZ2VtX3ZhX2lvY3Rs
IFthbWRncHVdXSAqRVJST1IqIENvdWxkbid0IAo+Pj4gdXBkYXRlIEJPX1ZBICgtMikKPj4+IFsg
MTQ3MS4zNTAzOTVdIFtkcm06YW1kZ3B1X2dlbV92YV9pb2N0bCBbYW1kZ3B1XV0gKkVSUk9SKiBD
b3VsZG4ndCAKPj4+IHVwZGF0ZSBCT19WQSAoLTIpCj4+PiBbIDE0NzEuMzUxODk1XSBhbWRncHUg
MDAwMDowMDowMS4wOiBmYWlsZWQgdG8gY2xlYXIgcGFnZSB0YWJsZXMgb24gCj4+PiBHRU0gb2Jq
ZWN0IGNsb3NlICgtMikKPj4+IFsgMTQ3MS4zNTM5OTVdIGFtZGdwdSAwMDAwOjAwOjAxLjA6IGZh
aWxlZCB0byBjbGVhciBwYWdlIHRhYmxlcyBvbiAKPj4+IEdFTSBvYmplY3QgY2xvc2UgKC0yKQo+
Pj4gWyAxNDcxLjM1NDE3OV0gW2RybTphbWRncHVfZ2VtX3ZhX2lvY3RsIFthbWRncHVdXSAqRVJS
T1IqIENvdWxkbid0IAo+Pj4gdXBkYXRlIEJPX1ZBICgtMikKPj4+IFsgMTQ3MS4zNTQxOTBdIGFt
ZGdwdSAwMDAwOjAwOjAxLjA6IGZhaWxlZCB0byBjbGVhciBwYWdlIHRhYmxlcyBvbiAKPj4+IEdF
TSBvYmplY3QgY2xvc2UgKC0yKQo+Pj4gWyAxNDcxLjM1NDI1Ml0gW2RybTphbWRncHVfZ2VtX3Zh
X2lvY3RsIFthbWRncHVdXSAqRVJST1IqIENvdWxkbid0IAo+Pj4gdXBkYXRlIEJPX1ZBICgtMikK
Pj4+IFsgMTQ3MS4zNTQyNTldIGFtZGdwdSAwMDAwOjAwOjAxLjA6IGZhaWxlZCB0byBjbGVhciBw
YWdlIHRhYmxlcyBvbiAKPj4+IEdFTSBvYmplY3QgY2xvc2UgKC0yKQo+Pj4gWyAxNDcxLjM1NDMw
Ml0gW2RybTphbWRncHVfZ2VtX3ZhX2lvY3RsIFthbWRncHVdXSAqRVJST1IqIENvdWxkbid0IAo+
Pj4gdXBkYXRlIEJPX1ZBICgtMikKPj4+IFsgMTQ3MS4zNTQzMDhdIGFtZGdwdSAwMDAwOjAwOjAx
LjA6IGZhaWxlZCB0byBjbGVhciBwYWdlIHRhYmxlcyBvbiAKPj4+IEdFTSBvYmplY3QgY2xvc2Ug
KC0yKQo+Pj4gWyAxNDcxLjM1NDM1MV0gW2RybTphbWRncHVfZ2VtX3ZhX2lvY3RsIFthbWRncHVd
XSAqRVJST1IqIENvdWxkbid0IAo+Pj4gdXBkYXRlIEJPX1ZBICgtMikKPj4+IFsgMTQ3MS4zNTQz
NTZdIGFtZGdwdSAwMDAwOjAwOjAxLjA6IGZhaWxlZCB0byBjbGVhciBwYWdlIHRhYmxlcyBvbiAK
Pj4+IEdFTSBvYmplY3QgY2xvc2UgKC0yKQo+Pj4KPj4+IFNvIGNsZWFybHkgdGhhdCdzIG5vdCB0
aGUgZml4IGVpdGhlciA6LS8KPj4+Cj4+PiAoYWxsIG9uIHRvcCBvZiB0aGUgbGF0ZXN0IGRybS1u
ZXh0IGZyb20gdGhpcyBtb3JuaW5nKS4KPj4+Cj4+PiBUb20KPj4+Cj4+Pgo+Pj4gT24gMjAyMC0w
MS0yMyA5OjIxIGEubS4sIENocmlzdGlhbiBLw7ZuaWcgd3JvdGU6Cj4+Pj4gQWxsb3cgcGFydGlh
bCBpbnZhbGlkYXRpb24gb24gdW5hbGxvY2F0ZWQgUERzLiBUaGlzIGlzIHVzZWZ1bCB3aGVuIHdl
Cj4+Pj4gbmVlZCB0byBzaWxlbmNlIGZhdWx0cyB0byBzdG9wIGludGVycnVwdCBmbG9vZHMgb24g
VmVnYS4KPj4+Pgo+Pj4+IFNpZ25lZC1vZmYtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlh
bi5rb2VuaWdAYW1kLmNvbT4KPj4+PiAtLS0KPj4+PiDCoCBkcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9hbWRncHVfdm0uYyB8IDIzICsrKysrKysrKysrKysrKysrKy0tLS0tCj4+Pj4gwqAgMSBm
aWxlIGNoYW5nZWQsIDE4IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCj4+Pj4KPj4+PiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3ZtLmMgCj4+Pj4g
Yi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdm0uYwo+Pj4+IGluZGV4IDgxMTlm
MzJjYTk0ZC4uMGY3OWMxNzExOGJmIDEwMDY0NAo+Pj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2FtZGdwdV92bS5jCj4+Pj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvYW1kZ3B1X3ZtLmMKPj4+PiBAQCAtMTQ2Nyw5ICsxNDY3LDggQEAgc3RhdGljIGludCBhbWRn
cHVfdm1fdXBkYXRlX3B0ZXMoc3RydWN0IAo+Pj4+IGFtZGdwdV92bV91cGRhdGVfcGFyYW1zICpw
YXJhbXMsCj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAqIHNtYWxsZXIgdGhhbiB0
aGUgYWRkcmVzcyBzaGlmdC4gR28gdG8gdGhlIG5leHQKPj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgICogY2hpbGQgZW50cnkgYW5kIHRyeSBhZ2Fpbi4KPj4+PiDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgICovCj4+Pj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaWYgKCFhbWRn
cHVfdm1fcHRfZGVzY2VuZGFudChhZGV2LCAmY3Vyc29yKSkKPj4+PiAtwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIHJldHVybiAtRU5PRU5UOwo+Pj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIGNvbnRpbnVlOwo+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlmIChhbWRncHVfdm1f
cHRfZGVzY2VuZGFudChhZGV2LCAmY3Vyc29yKSkKPj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIGNvbnRpbnVlOwo+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoCB9IGVsc2UgaWYgKGZy
YWcgPj0gcGFyZW50X3NoaWZ0KSB7Cj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLyog
SWYgdGhlIGZyYWdtZW50IHNpemUgaXMgZXZlbiBsYXJnZXIgdGhhbiB0aGUgcGFyZW50Cj4+Pj4g
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAqIHNoaWZ0IHdlIHNob3VsZCBnbyB1cCBvbmUg
bGV2ZWwgYW5kIGNoZWNrIGl0IGFnYWluLgo+Pj4+IEBAIC0xNDgwLDggKzE0NzksMTkgQEAgc3Rh
dGljIGludCBhbWRncHVfdm1fdXBkYXRlX3B0ZXMoc3RydWN0IAo+Pj4+IGFtZGdwdV92bV91cGRh
dGVfcGFyYW1zICpwYXJhbXMsCj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgIH0KPj4+PiDCoCDCoMKg
wqDCoMKgwqDCoMKgwqAgcHQgPSBjdXJzb3IuZW50cnktPmJhc2UuYm87Cj4+Pj4gLcKgwqDCoMKg
wqDCoMKgIGlmICghcHQpCj4+Pj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIC1FTk9F
TlQ7Cj4+Pj4gK8KgwqDCoMKgwqDCoMKgIGlmICghcHQpIHsKPj4+PiArwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCAvKiBXZSBuZWVkIGFsbCBQRHMgYW5kIFBUcyBmb3IgbWFwcGluZyBzb21ldGhpbmcs
ICovCj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaWYgKGZsYWdzICYgQU1ER1BVX1BURV9W
QUxJRCkKPj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiAtRU5PRU5U
Owo+Pj4+ICsKPj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAvKiBidXQgdW5tYXBwaW5nIHNv
bWV0aGluZyBjYW4gaGFwcGVuIGF0IGEgaGlnaGVyCj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCAqIGxldmVsLiAqLwo+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlmICghYW1kZ3B1
X3ZtX3B0X2FuY2VzdG9yKCZjdXJzb3IpKQo+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgcmV0dXJuIC1FSU5WQUw7Cj4+Pj4gKwo+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IHB0ID0gY3Vyc29yLmVudHJ5LT5iYXNlLmJvOwo+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IHNoaWZ0ID0gcGFyZW50X3NoaWZ0Owo+Pj4+ICvCoMKgwqDCoMKgwqDCoCB9Cj4+Pj4gwqAgwqDC
oMKgwqDCoMKgwqDCoMKgIC8qIExvb2tzIGdvb2Qgc28gZmFyLCBjYWxjdWxhdGUgcGFyYW1ldGVy
cyBmb3IgdGhlIAo+Pj4+IHVwZGF0ZSAqLwo+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBpbmNyID0g
KHVpbnQ2NF90KUFNREdQVV9HUFVfUEFHRV9TSVpFIDw8IHNoaWZ0Owo+Pj4+IEBAIC0xNDk1LDYg
KzE1MDUsOSBAQCBzdGF0aWMgaW50IGFtZGdwdV92bV91cGRhdGVfcHRlcyhzdHJ1Y3QgCj4+Pj4g
YW1kZ3B1X3ZtX3VwZGF0ZV9wYXJhbXMgKnBhcmFtcywKPj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCB1aW50NjRfdCB1cGRfZW5kID0gbWluKGVudHJ5X2VuZCwgZnJhZ19lbmQpOwo+Pj4+
IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHVuc2lnbmVkIG5wdGVzID0gKHVwZF9lbmQgLSBm
cmFnX3N0YXJ0KSA+PiBzaGlmdDsKPj4+PiDCoCArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAvKiBU
aGlzIGNhbiBoYXBwZW4gd2hlbiB3ZSBzZXQgaGlnaGVyIGxldmVsIFBEcyB0bwo+Pj4+ICvCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgKiBzaWxlbnQgdG8gc3RvcCBmYXVsdCBmbG9vZHMuICovCj4+
Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgbnB0ZXMgPSBtYXgobnB0ZXMsIDF1KTsKPj4+PiDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBhbWRncHVfdm1fdXBkYXRlX2ZsYWdzKHBhcmFtcywg
cHQsIGN1cnNvci5sZXZlbCwKPj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBwZV9zdGFydCwgZHN0LCBucHRlcywgaW5jciwKPj4+PiDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBm
bGFncyB8IEFNREdQVV9QVEVfRlJBRyhmcmFnKSk7Cj4KX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9hbWQtZ2Z4Cg==
